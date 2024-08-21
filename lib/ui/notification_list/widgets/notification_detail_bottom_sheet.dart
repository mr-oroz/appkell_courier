import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/notification_model.dart';

class NotificationDetailBottomSheet extends HookConsumerWidget {
  const NotificationDetailBottomSheet({
    super.key,
    required this.notification,
  });

  final NotificationModel notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.6,
        maxChildSize: 1,
        expand: false,
        builder: (_, controller) {
          return SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                const Gap(10),
                Container(
                  width: 54,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xFFD9D9D9),
                  ),
                ),

                const SizedBox(
                  height: 14,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (notification.image != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            notification.image!,
                            height: 264,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      const Gap(15),
                      if (notification.title != null)
                        Text(
                          notification.title!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      const Gap(15),
                      if (notification.description != null)
                        Text(
                          notification.description!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF434343),
                          ),
                        ),
                    ],
                  ),
                ),

                // if (notification.product?.price != null ||
                //     notification.product?.newPrice != null)
              ],
            ),
          );
        });
  }
}
