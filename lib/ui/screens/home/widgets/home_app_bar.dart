import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/models/profile_model.dart';
import '../../../../providers/notification_providers.dart';
import '../../../notification_list/notification_list_screen.dart';
import '../../../widgets/app_icon.dart';
import '../../address_information/select_location_screen.dart';

class HomeAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    this.storeAdress,
    this.role,
    this.latitude,
    this.longitude,
    this.unreadCount,
  });

  final String? storeAdress;
  final Role? role;
  final double? latitude;
  final double? longitude;
  final int? unreadCount;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: role != null
          ? Row(
              children: [
                const Gap(15),
                if (role!.isSalesman) ...[
                  const AppIcon(
                    AppIcons.location,
                    size: 20,
                    color: Colors.black,
                  ),
                  const Gap(10),
                  Flexible(
                    child: Text(
                      longitude != null || latitude != null
                          ? 'Координаты приняты'
                          : '.........',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectLocationScreen(
                            latitude: latitude,
                            longitude: longitude,
                          ),
                        ),
                      );
                    },
                    icon: const AppIcon(AppIcons.arrow_down_vertical),
                  ),
                ] else
                  const Text(
                    'Добро пожаловать!',
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
              ],
            )
          : null,
      actions: [
        GestureDetector(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationListScreen(),
              ),
            );
            ref.read(unreadNotificationCountProvider.notifier).markAsRead();
          },
          child: SizedBox(
            height: 45,
            width: 45,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const AppIcon(AppIcons.notification),
                if (unreadCount != 0 && unreadCount != null)
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFF6C29),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        unreadCount.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const Gap(15)
      ],
    );
  }
}
