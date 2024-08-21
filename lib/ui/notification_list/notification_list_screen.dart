import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/notification_model.dart';

import '../../../providers/notification_providers.dart';

import '../../providers/user_providers.dart';
import '../screens/profile/profile_screen.dart';
import '../widgets/app_icon.dart';
import 'widgets/notification_detail_bottom_sheet.dart';

class NotificationListScreen extends HookConsumerWidget {
  const NotificationListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationList = ref.watch(notificationListProvider);
    final groupedNotifications = useMemoized(() {
      return groupBy<NotificationModel, dynamic>(notificationList.value ?? [],
          (NotificationModel n) {
        final date = n.date;
        return n.isRead == false
            ? "Новое"
            : date != null
                ? DateTime(date.year, date.month, date.day)
                : DateTime(0, 0, 0);
      });
    }, [notificationList.value]);
    final userState = ref.watch(userProvider);
    final scrollController = useScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (notificationList.isRefreshing ||
            notificationList.isLoading ||
            notificationList.isReloading) return;
        ref.read(notificationListProvider.notifier).loadMore();
      }
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
              // ref.read(basketProvider.notifier).addMulti([]);
            },
            icon: const AppIcon(
              AppIcons.arrow_down,
            ),
          ),
        ),
        title: const Text(
          'Уведомления',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return ref.invalidate(notificationListProvider);
        },
        child: ListView.builder(
          controller: scrollController,
          itemCount: groupedNotifications.length,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemBuilder: (context, index) {
            final groupKey = groupedNotifications.keys.elementAt(index);
            final notificationsForDate = groupedNotifications[groupKey]!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (groupKey == "Новое")
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Новое',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Text(
                      formatDate(groupKey),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                for (var notification in notificationsForDate)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: const Color(0xFFFFFFFF),
                          builder: (context) => NotificationDetailBottomSheet(
                            notification: notification,
                          ),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (notification.image != null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                notification.image!,
                                height: 70,
                                width: 70,
                              ),
                            ),
                          const Gap(10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (notification.title != null)
                                  Text(
                                    notification.title!,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 2,
                                  ),
                                const Gap(5),
                                if (notification.description != null)
                                  Text(
                                    notification.description!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xFFA5A5A5),
                                    ),
                                    maxLines: 2,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Container(
                  height: 1,
                  margin: const EdgeInsets.only(left: 80, top: 15, bottom: 15),
                  color: const Color(0xFFD9D9D9),
                ),
              ],
            );
          },
        ),
        //  notificationList.when(
        //   skipLoadingOnRefresh: false,
        //   data: (data) {
        //     if (data.isEmpty) {
        //       return const Center(
        //         child: Text('Уведомлений нет'),
        //       );
        //     }
        //     return
        //   },
        //   error: (e, error) {
        //     return const Center(
        //       child: Text('Уведомлений нет'),
        //     );
        //   },
        //   loading: () => const SizedBox(),
        //   //  const Center(
        //   //   child: SizedBox(
        //   //       height: 40,
        //   //       width: 40,
        //   //       child: CircularProgressIndicator.adaptive()),
        //   // ),
        // ),
      ),
    );
  }
}
