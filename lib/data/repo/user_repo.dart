import 'dart:io';

import 'package:appkel_for_courier_flutter/data/models/address_details_model.dart';
import 'package:appkel_for_courier_flutter/data/models/search_location_model.dart';
import 'package:dio/dio.dart';

import '../client/client.dart';
import '../models/api_reponse.dart';
import '../models/change_password_model.dart';
import '../models/code_verify_model.dart';
import '../models/fcm_create_model.dart';
import '../models/profile_model.dart';
import '../models/registration_model.dart';
import '../models/token/token.dart';
import '../models/user_credentials_model.dart';

abstract final class UserRepo {
  Future<ApiResponse<Token>> login(String login, String password);
  Future<ApiResponse> register(RegistrationModel model);
  Future<ApiResponse> createFcm(FcmCreateModel fcmCreateModel);
  Future<ApiResponse> deleteFcm(String deviceId);
  Future<ApiResponse<bool>> hasPhoneNumber(String phone);
  Future<ApiResponse> sendCode(String? phone, String? email);
  Future<ApiResponse<Token?>> codeVerify(CodeVerifyModel model);
  Future<ApiResponse<Token?>> changePassword(ChangePasswordModel model);
  Future<ApiResponse<Token?>> sendUserCredentials(UserCredentialsModel model);
  Future<ApiResponse<ProfileModel>> profile();
  Future<ApiResponse<ProfileModel>> updateProfile(Map<String, dynamic> model);
  Future<ApiResponse<bool>> isHasEmail(String email);
  Future<ApiResponse> kitchenRestaurants(List<int> ids);
  Future<ApiResponse> setAddressDetails(AddressDetailsModel model);
  Future<ApiResponse> addRequisite(String nums, String title);
  Future<ApiResponse> updateRequisite(String id, String nums, String title);
  Future<ApiResponse> deleteRequisite(String id);
  Future<ApiResponse> deleteAccount();
  Future<ApiResponse<String>> whatsappNumber();
  Future<ApiResponse<List<SearchLocationModel>>> searchLocationUser(
      String query);
}

base class UserAPIRepo implements UserRepo {
  const UserAPIRepo({required ApiClient client}) : _client = client;
  final ApiClient _client;

  @override
  Future<ApiResponse<Token>> login(String login, String password) {
    return _client.post(
      'accounts/login/?is_shop_app=true',
      data: {
        'login': login,
        'password': password,
      },
      decoder: (data) {
        return Token.fromMap(data['tokens']);
      },
    );
  }

  @override
  Future<ApiResponse> kitchenRestaurants(List<int> ids) {
    return _client.post(
      'accounts/kitchen_restaurants/',
      data: {'kitchen_ids': ids},
    );
  }

  @override
  Future<ApiResponse> register(RegistrationModel model) async {
    var formData = FormData.fromMap({
      ...model.toMap(),
      if (model.frontPassport != null)
        "passport_front":
            await MultipartFile.fromFile(model.frontPassport!.path),
      if (model.backPassport != null)
        "passport_back": await MultipartFile.fromFile(model.backPassport!.path),
      if (model.legalFileFaces != null)
        "entity_file": await MultipartFile.fromFile(model.legalFileFaces!.path),
    });
    return _client.post(
      'accounts/register/',
      data: formData,
    );
  }

  @override
  Future<ApiResponse> createFcm(FcmCreateModel fcmCreateModel) {
    // print(fcmCreateModel.toJson());
    return _client.post(
      'accounts/devices',
      data: fcmCreateModel.toJson(),
    );
  }

  @override
  Future<ApiResponse> deleteFcm(String deviceId) async {
    return _client.delete(
      'auth/delete/fcm/$deviceId',
    );
  }

  @override
  Future<ApiResponse<bool>> hasPhoneNumber(String phone) async {
    return _client.get(
      'auth/$phone',
      decoder: (data) => data['is_has_phone_number'] ?? false,
    );
  }

  @override
  Future<ApiResponse<bool>> sendCode(String? phone, String? email) async {
    return _client.post(
      'accounts/send_code/',
      data: {
        if (email != null) 'email': email,
        if (phone != null) 'phone': phone,
      },
    );
  }

  @override
  Future<ApiResponse<Token?>> codeVerify(CodeVerifyModel model) async {
    return _client.post(
      'accounts/verify/',
      data: model.toMap(),
      decoder: (data) {
        if (data['tokens'] == null) {
          return null;
        }
        return Token.fromMap(data['tokens']);
      },
    );
  }

  @override
  Future<ApiResponse<Token?>> changePassword(ChangePasswordModel model) async {
    return _client.patch(
      'accounts/set-new-password/',
      data: model.toMap(),
      decoder: (data) {
        if (data['tokens'] == null) {
          return null;
        }
        return Token.fromMap(data['tokens']);
      },
    );
  }

  @override
  Future<ApiResponse<Token?>> sendUserCredentials(
      UserCredentialsModel model) async {
    return _client.post(
      'accounts/social-login/?is_shop_app=true',
      data: model.toJson(),
      decoder: (data) {
        if (data['tokens'] == null) {
          return null;
        }

        return Token.fromMap(data['tokens']);
      },
    );
  }

  @override
  Future<ApiResponse<ProfileModel>> profile() async {
    return _client.get(
      'accounts/detail/',
      decoder: (data) {
        return ProfileModel.fromJson(data);
      },
    );
  }

  @override
  Future<ApiResponse<ProfileModel>> updateProfile(
    Map<String, dynamic> model,
  ) async {
    dynamic data = model;
    final avatar = model['photo'] as File?;
    data = FormData.fromMap({
      ...?data,
      if (avatar != null)
        'photo': MultipartFile.fromBytes(
          await avatar.readAsBytes(),
          filename: avatar.path.split('/').last,
        )
      else if (data['is_delete'] == true)
        'photo': null,
      if (data['entity_file'] != null)
        'entity_file': MultipartFile.fromBytes(
          await data['entity_file'].readAsBytes(),
          filename: data['entity_file'].path.split('/').last,
        )
    });

    return _client.patch(
      'accounts/detail/',
      data: data,
      decoder: (data) {
        return ProfileModel.fromJson(data);
      },
    );
  }

  @override
  Future<ApiResponse<bool>> isHasEmail(String email) {
    return _client.post(
      'accounts/check-email/',
      data: {
        'email': email,
      },
      decoder: (data) {
        return data['is_verified'] ?? false;
      },
    );
  }

  @override
  Future<ApiResponse> setAddressDetails(AddressDetailsModel model) {
    return _client.post(
      'accounts/check-email/',
      data: model,
    );
  }

  @override
  Future<ApiResponse> addRequisite(String nums, String title) {
    return _client.post(
      'accounts/deposit-details/',
      data: {
        "title": title,
        "nums": nums,
      },
    );
  }

  @override
  Future<ApiResponse> updateRequisite(String id, String nums, String title) {
    return _client.patch(
      'accounts/deposit-details/$id/',
      data: {
        "title": title,
        "nums": nums,
      },
    );
  }

  @override
  Future<ApiResponse> deleteRequisite(String id) {
    return _client.delete(
      'accounts/deposit-details/$id/',
    );
  }

  @override
  Future<ApiResponse> deleteAccount() {
    return _client.delete(
      'accounts/detail/',
    );
  }

  @override
  Future<ApiResponse<String>> whatsappNumber() {
    return _client.get(
      'accounts/whatsapp-number/',
      decoder: (data) {
        return data['whatsapp_number'];
      },
    );
  }

  @override
  Future<ApiResponse<List<SearchLocationModel>>> searchLocationUser(
      String query) async {
    print(query);
    if (query.isNotEmpty) {
      const url = 'search.php';
      final params = {'q': query, 'accept-language': 'ru'};
      try {
        return await _client.request(
          url,
          "GET",
          params: params,
          usePort: true,
          decoder: (data) {
            return List.from(data.map((e) => SearchLocationModel.fromJson(e)));
          },
        );
      } on DioException catch (e) {
        return ApiResponse<List<SearchLocationModel>>(
          errorData: 'Ошибка при выполнении запроса: ${e.response?.statusCode}',
        );
      }
    } else {
      return ApiResponse<List<SearchLocationModel>>(
          message: 'Запрос не предоставлен');
    }
  }
}
