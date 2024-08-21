import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../config/config.dart';
import '../data/client/client.dart';

import '../data/repo/notification_repo.dart';
import '../data/repo/order_repo.dart';
import '../data/repo/user_repo.dart';
import '../data/storage/local_storage.dart';

const unauthorizedErrorCode = 401;

final localStorageProvider = Provider(
  (ref) => LocalStorage(),
);

final dioProvider = Provider(
  (ref) => Dio(BaseOptions(baseUrl: Constants.baseUrl)),
);

final clientErrorProvider = Provider((ref) => ClientErrorNotifier());

class ClientErrorNotifier extends StateNotifier<int?> {
  ClientErrorNotifier() : super(null);

  void notifyError(int? code) => state = code;

  // Check if there's an unauthorized error
  bool get isUnauthorized => state == unauthorizedErrorCode;
}

final apiClientProvider = Provider(
  (ref) => ApiClient(
    Constants.baseUrl,
    storage: ref.read(localStorageProvider),
    onErrorRefresh: () {
      ref.read(clientErrorProvider).notifyError(unauthorizedErrorCode);
    },
  ),
);

final userRepoProvider = Provider<UserRepo>((ref) {
  return UserAPIRepo(client: ref.watch(apiClientProvider));
});
final orderRepoProvider = Provider<OrderRepo>((ref) {
  return OrderAPIRepo(client: ref.watch(apiClientProvider));
});

final notificationRepoProvider = Provider<NotificationRepo>((ref) {
  return NotificationAPIRepo(client: ref.watch(apiClientProvider));
});
