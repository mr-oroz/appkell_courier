import 'dart:io';
import 'package:android_id/android_id.dart';
import 'package:appkel_for_courier_flutter/data/models/search_location_model.dart';
import 'package:appkel_for_courier_flutter/providers/user_providers.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../config/utils/push_notifications_manager.dart';
import '../data/models/code_verify_model.dart';
import '../data/models/fcm_create_model.dart';
import '../data/models/registration_model.dart';
import '../data/models/user_credentials_model.dart';
import '../data/models/change_password_model.dart';
import '../data/models/token/token.dart';
import '../data/storage/local_storage.dart';
import 'dependencies.dart';

part 'auth_providers.g.dart';
part 'auth_providers.freezed.dart';

enum AuthStatus {
  initial,
  loading,
  success,
  error,
  hasNotPhoneNumber,
  codeVerify,
  hasNotEmail,
  authenticated,
  unauthenticated;

  bool get isInitial => this == initial;
  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
  bool get isError => this == error;
  bool get isHasNotPhoneNumber => this == hasNotPhoneNumber;
  bool get isCodeVerify => this == codeVerify;
  bool get isHasNotEmail => this == hasNotEmail;
  bool get isAuth => this == authenticated;
  bool get isUnauth => this == unauthenticated;
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AuthStatus status,
    String? address,
    String? lat,
    String? lon,
    String? password,
    String? errorText,
    UserCredentialsModel? userCredentialsModel,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState(
      status: AuthStatus.unauthenticated, address: '', lat: '', lon: '');
}

@riverpod
class Auth extends _$Auth {
  LocalStorage get localStorage => ref.read(localStorageProvider);

  @override
  AuthState build() {
    return AuthState(
      status: localStorage.token != null
          ? AuthStatus.authenticated
          : AuthStatus.unauthenticated,
    );
  }

  final _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  Future<void> sendCode(String? phone, String? email) async {
    state = const AuthState(status: AuthStatus.loading);
    final response = await ref.read(userRepoProvider).sendCode(phone, email);
    if (response.isSuccessful) {
      state = const AuthState(
        status: AuthStatus.success,
      );
    } else {
      state = AuthState(
          status: AuthStatus.hasNotPhoneNumber,
          errorText: (response.errorData as Map)['message'] ??
              'Такой номер не зарегистрирован'
          //response.errorData?.toString(),
          );
    }
  }

  Future<void> codeVerify(
      CodeVerifyModel model, bool isRecoveryPassword) async {
    state = const AuthState(status: AuthStatus.loading);
    final response = await ref.read(userRepoProvider).codeVerify(model);

    if (response.isSuccessful) {
      if (response.result != null && !isRecoveryPassword) {
        ref.read(authProvider.notifier).authenticate(response.result!);
      } else {
        state = const AuthState(status: AuthStatus.codeVerify);
      }
    } else {
      state = const AuthState(
        status: AuthStatus.error,
        errorText:
            // response.errorData?.toString() ??
            'Код неверный или устарел',
      );
    }
  }

  void setAddress(String value, {required String lat, required String lon}) {
    LocalStorage.instance.setString('lat', lat);
    LocalStorage.instance.setString('lon', lon);
    state = state.copyWith(address: value, lat: lat, lon: lon);
  }

  Future<void> googleSignIn() async {
    state = const AuthState(status: AuthStatus.loading);
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      state = const AuthState(status: AuthStatus.initial);
      return;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final name = googleUser.displayName;
    final idToken = (await userCredential.user?.getIdToken(true))!;
    final email = userCredential.user?.email;
    await isHasEmail(
      UserCredentialsModel(
        idToken: idToken,
        name: name,
        email: email,
        ////
        role: 'shop',
      ),
    );
  }

  Future<void> appleIdSignIn() async {
    // state = const AuthState(status: AuthStatus.loading);

    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      if (appleCredential.userIdentifier != null) {
        final credential = OAuthProvider('apple.com').credential(
          accessToken: appleCredential.authorizationCode,
          idToken: appleCredential.identityToken,
        );
        // AppleAuthProvider.credential(appleCredential.authorizationCode);
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        final idToken = await userCredential.user?.getIdToken();
        final email = userCredential.user?.email;
        final name = userCredential.user?.displayName;

        await isHasEmail(
          UserCredentialsModel(
            idToken: idToken,
            name: name,
            email: email,
            ///////
            role: 'shop',
          ),
        );
      }
    } on SignInWithAppleException {
      // print('sign in with apple $e');
    } catch (e) {
      // print(e.toString());
    }
  }

  // Future<void> signInWithFacebook() async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login();

  //     if (result.status == LoginStatus.success) {
  //       final OAuthCredential credential =
  //           FacebookAuthProvider.credential(result.accessToken!.token);

  //       final userCredential =
  //           await FirebaseAuth.instance.signInWithCredential(credential);
  //       // print(
  //       //   UserCredentialsModel(
  //       //     idToken: userCredential.user!.getIdToken().toString(),
  //       //     name: userCredential.user?.displayName,
  //       //     email: userCredential.user?.email,
  //       //   ),
  //       // );
  //       await sendUserCredentials(
  //         UserCredentialsModel(
  //           idToken: userCredential.user!.getIdToken().toString(),
  //           name: userCredential.user?.displayName,
  //           email: userCredential.user?.email,
  //         ),
  //       );
  //     } else {
  //       throw Exception('Failed to login with Facebook');
  //     }
  //   } catch (error) {
  //     print('$error');
  //     rethrow;
  //   }
  // }

  Future<void> isHasEmail(UserCredentialsModel model) async {
    final response = await ref.read(userRepoProvider).isHasEmail(model.email!);
    if (response.isSuccessful && response.result == true) {
      sendUserCredentials(model);
    } else if (response.statusCode == 404) {
      sendUserCredentials(model);
      //state = AuthState(
      //  userCredentialsModel: model,
      //  status: AuthStatus.hasNotEmail,
      //);
    } else {
      state = AuthState(
        status: AuthStatus.error,
        errorText: response.errorData?.toString() ?? 'Что-то пошло не так',
      );
    }
  }

  Future<void> sendUserCredentials(UserCredentialsModel model) async {
    final response =
        await ref.read(userRepoProvider).sendUserCredentials(model);

    if (response.isSuccessful) {
      ref.read(authProvider.notifier).authenticate(response.result!);
    } else {
      state = AuthState(
        status: AuthStatus.error,
        errorText: response.errorData?.toString() ?? 'Что-то пошло не так',
      );
    }
  }

  void authenticate(Token token) async {
    localStorage.token = token;
    createFCM();
    state = state.copyWith(
      status: AuthStatus.authenticated,
    );
    final lat = LocalStorage.instance.getString('lat');
    final lon = LocalStorage.instance.getString('lon');
    if (lat != null && lon != null) {
      await ref.read(userProvider.notifier).updateProfile({
        'latitude': lat,
        'longitude': lat,
      });
    }
    ref.invalidate(userProvider);
  }

  void unauthenticate() {
    localStorage.token = null;
    state = state.copyWith(
      status: AuthStatus.unauthenticated,
    );
  }

  Future<void> createFCM([String? token]) async {
    token = token ?? PushNotificationsManager().getToken();
    if (token != null) {
      final deviceInfo = DeviceInfoPlugin();
      String? deviceName;
      String? deviceId;
      String type = '';

      if (Platform.isAndroid) {
        final info = await deviceInfo.androidInfo;
        deviceName = info.model;
        deviceId = await const AndroidId().getId();
        type = 'android';
      } else if (Platform.isIOS) {
        final info = await deviceInfo.iosInfo;
        deviceName = info.utsname.machine;
        deviceId = info.identifierForVendor;
        type = 'ios';
      }

      final response = await ref.read(userRepoProvider).createFcm(
            FcmCreateModel(
              registrationId: token,
              type: type,
              deviceId: deviceId,
              name: deviceName,
            ),
          );

      if (response.statusCode == 401) {
        // logout();
      }
    }
  }

  Future<void> deleteFCM() async {
    try {
      String? deviceId;

      if (Platform.isAndroid) {
        deviceId = await const AndroidId().getId();
      } else if (Platform.isIOS) {
        final info = await DeviceInfoPlugin().iosInfo;
        deviceId = info.identifierForVendor;
      }
      if (deviceId != null) {
        await ref.read(userRepoProvider).deleteFcm(deviceId);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteAccount() async {
    final response = await ref.read(userRepoProvider).deleteAccount();
    if (response.isSuccessful) {
      ref.read(authProvider.notifier).unauthenticate();
    }
  }
}

@riverpod
bool authStatus(AuthStatusRef ref) {
  final auth = ref.watch(authProvider);
  return auth.status.isAuth;
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    String? error,
    required AuthStatus status,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
        status: AuthStatus.initial,
      );
}

@riverpod
class Login extends _$Login {
  @override
  LoginState build() {
    return LoginState.initial();
  }

  Future<void> login(String login, String password) async {
    state = const LoginState(status: AuthStatus.loading);

    final response = await ref.read(userRepoProvider).login(login, password);

    if (response.isSuccessful) {
      ref.read(authProvider.notifier).authenticate(response.result!);
      state = const LoginState(status: AuthStatus.success);
      return;
    }
    state = const LoginState(
      status: AuthStatus.error,
      error: 'Неверный логин или пароль',
    );
  }
}

@riverpod
class SearchLocation extends _$SearchLocation {
  @override
  Future<List<SearchLocationModel>> build(String query) async {
    final response = await ref.read(userRepoProvider).searchLocationUser(query);
    if (response.result?.isEmpty ?? true) {
      return [];
    }
    return response.result!;
  }
}

// Регистрация
@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    String? error,
    required AuthStatus status,
  }) = _RegistrationState;

  factory RegistrationState.initial() =>
      const RegistrationState(status: AuthStatus.initial);
}

@riverpod
class Registration extends _$Registration {
  @override
  RegistrationState build() {
    return RegistrationState.initial();
  }

  Future<void> register(RegistrationModel model, bool isPhoneRegister) async {
    state = const RegistrationState(status: AuthStatus.loading);
    final response = await ref.read(userRepoProvider).register(model);

    if (response.isSuccessful) {
      state = const RegistrationState(status: AuthStatus.success);
      return;
    }
    if (response.statusCode == 400) {
      state = RegistrationState(
        status: AuthStatus.error,
        error:
            'Пользователь с ${isPhoneRegister ? 'таким телефоном' : 'такой почтой'}'
            ' уже зарегистрирован',
      );
    } else if (response.errorData != null && response.errorData is Map) {
      final errorData = response.errorData as Map<String, dynamic>;
      state = RegistrationState(
        status: AuthStatus.error,
        error: errorData.toString(),
      );
    } else {
      state = const RegistrationState(
        status: AuthStatus.error,
        error: 'Что-то пошло не так',
      );
}
  }
}

// Восстановление пароля
@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    String? error,
    required AuthStatus status,
  }) = _ChangePasswordState;

  factory ChangePasswordState.initial() => const ChangePasswordState(
        status: AuthStatus.initial,
      );
}

@riverpod
class ChangePassword extends _$ChangePassword {
  @override
  ChangePasswordState build() {
    return ChangePasswordState.initial();
  }

  Future<void> changePassword(ChangePasswordModel model) async {
    state = const ChangePasswordState(status: AuthStatus.loading);
    final response = await ref.read(userRepoProvider).changePassword(model);

    if (response.isSuccessful) {
      state = const ChangePasswordState(status: AuthStatus.success);
    } else {
      state = const ChangePasswordState(
        status: AuthStatus.error,
        error: 'Что-то пошло не так',
      );
    }
  }
}
