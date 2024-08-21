import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/notification_model.dart';
import 'dependencies.dart';

part 'notification_providers.g.dart';

@riverpod
class NotificationList extends _$NotificationList {
  int currentPage = 2;

  @override
  Future<List<NotificationModel>> build() async {
    final response =
        await ref.read(notificationRepoProvider).notificationList();

    if (!response.isSuccessful) {
      // throw response.errorData;
    }

    return response.result ??
        [
          // NotificationModel(
          //   image: 'https://via.placeholder.com/150',
          //   isRead: true,
          //   id: 1,
          //   title: 'Блиц-Распродажа: Взрыв Скидок на Любимые Продукты!',
          //   dateTime: DateTime.now(),
          //   description:
          //       'Готовьтесь к феерии скидок! Наше приложение запускает грандиозную блиц-распродажу, предоставляя уникальную возможность сэкономить круглую сумму на вашем следующем заказе.',
          // ),
          // NotificationModel(
          //   id: 1,
          //   isRead: true,
          //   title: 'Блиц-Распродажа: Взрыв Скидок на Любимые Продукты!',
          //   dateTime: DateTime.now(),
          //   description:
          //       'Готовьтесь к феерии скидок! Наше приложение запускает грандиозную блиц-распродажу, предоставляя уникальную возможность сэкономить круглую сумму на вашем следующем заказе.',
          //   product: const ProductModel(
          //     id: 1,

          //     // newPrice: 80,
          //   ),
          // ),
          // NotificationModel(
          //   id: 1,
          //   title: 'Блиц-Распродажа: Взрыв Скидок на Любимые Продукты!',
          //   dateTime: DateTime.now().subtract(const Duration(days: 1)),
          //   description:
          //       'Готовьтесь к феерии скидок! Наше приложение запускает грандиозную блиц-распродажу, предоставляя уникальную возможность сэкономить круглую сумму на вашем следующем заказе.',
          // ),
          // NotificationModel(
          //   id: 1,
          //   title: 'Блиц-Распродажа: Взрыв Скидок на Любимые Продукты!',
          //   dateTime: DateTime.now().subtract(const Duration(days: 1)),
          //   description:
          //       'Готовьтесь к феерии скидок! Наше приложение запускает грандиозную блиц-распродажу, предоставляя уникальную возможность сэкономить круглую сумму на вашем следующем заказе.',
          // ),
          // NotificationModel(
          //   id: 1,
          //   title: 'Блиц-Распродажа: Взрыв Скидок на Любимые Продукты!',
          //   dateTime: DateTime.now().subtract(const Duration(days: 7)),
          //   description:
          //       'Готовьтесь к феерии скидок! Наше приложение запускает грандиозную блиц-распродажу, предоставляя уникальную возможность сэкономить круглую сумму на вашем следующем заказе.',
          // ),
        ];
  }

  void loadMore({
    String? searchText,
  }) async {
    if (state.isLoading || state.isRefreshing || state.isReloading) return;
    state = const AsyncValue<List<NotificationModel>>.loading()
        .copyWithPrevious(state);
    final response = await ref.read(notificationRepoProvider).notificationList(
          page: currentPage,
        );

    List<NotificationModel> list = response.result ?? [];
    currentPage++;

    state = AsyncValue.data([...?state.value, ...list]);
  }
}

// @riverpod
// Future<int?> unreadNotificationCount(UnreadNotificationCountRef ref) async {
//   final response =
//       await ref.read(notificationRepoProvider).unreadNotificationCount();
//   if (!response.isSuccessful) {
//     // throw response.errorData;
//     return null;
//   }
//   return response.result;
// }

@riverpod
class UnreadNotificationCount extends _$UnreadNotificationCount {
  @override
  Future<int?> build() async {
    final response =
        await ref.read(notificationRepoProvider).unreadNotificationCount();

    if (!response.isSuccessful) {
      // throw response.errorData;
      return null;
    }
    return response.result;
  }

  void markAsRead() async {
    state = const AsyncValue.data(null);
  }
}
