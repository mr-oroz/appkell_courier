import '../client/client.dart';
import '../models/api_reponse.dart';
import '../models/notification_model.dart';

abstract final class NotificationRepo {
  Future<ApiResponse<List<NotificationModel>>> notificationList({int? page});
  Future<ApiResponse<int>> unreadNotificationCount();
}

base class NotificationAPIRepo implements NotificationRepo {
  const NotificationAPIRepo({required ApiClient client}) : _client = client;
  final ApiClient _client;

  @override
  Future<ApiResponse<List<NotificationModel>>> notificationList({int? page}) {
    return _client.get(
      params: {
        if (page != null) 'page': page,
      },
      'accounts/notifications/',
      decoder: (data) {
        return List.from(
          data['results'].map(
            (e) => NotificationModel.fromJson(e),
          ),
        );
      },
    );
  }

  @override
  Future<ApiResponse<int>> unreadNotificationCount() {
    return _client.get(
      'accounts/notifications/unread_count/',
      decoder: (data) => data['unread_count'],
    );
  }
}
