import 'dart:io';

import 'package:appkel_for_courier_flutter/app/app.dart';
import 'package:appkel_for_courier_flutter/data/models/conent_file_model.dart';
import 'package:appkel_for_courier_flutter/helpers/image_helper.dart';
import 'package:appkel_for_courier_flutter/providers/content_providers.dart';
import 'package:appkel_for_courier_flutter/providers/product_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/registration/widgets/custom_text_form_field.dart';
import 'package:appkel_for_courier_flutter/ui/screens/home/widgets/search_product_text_field.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/content_screen.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/cached_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class AddContentSheet extends HookConsumerWidget {
  const AddContentSheet({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentState = ref.watch(contentProvidersProvider);
    final contentNotifier = ref.read(contentProvidersProvider.notifier);

    void onAddMedia() async {
      final image = await ImageHelper.pickMediaFromSource(context);
      
      if (image != null) {
        if (image.path.endsWith('.mp4')) {
          final thumbnail = await VideoThumbnail.thumbnailFile(
            video: image.path,
            imageFormat: ImageFormat.PNG,
            quality: 75,
            maxHeight: 93,
          );
          contentNotifier.addFiles(ContentFileModel(
              media: image, thumbnailPath: thumbnail, isActive: false));
        } else {
          contentNotifier
              .addFiles(ContentFileModel(media: image, isActive: false));
        }
      }
    }

    void toggleActive(ContentFileModel file) {
      contentNotifier.toggleActive(file);
    }

    return SafeArea(
      child: Wrap(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 7),
              width: 54,
              height: 2,
              color: const Color(0xFFD9D9D9),
            ),
          ),
          const SizedBox(
            height: 16,
            width: double.infinity,
          ),
          SizedBox(
            height: 93,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                InkWell(
                  onTap: onAddMedia,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(15),
                    dashPattern: const [8, 4],
                    color: const Color(0xffFF6C29),
                    strokeWidth: 2,
                    child: Container(
                      height: 93,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      width: 93,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: AppIcon(
                          AppIcons.camera_plus,
                          color: Color(0xffFF6C29),
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(5),
                if (contentState.files.isNotEmpty)
                  ...contentState.files.map((item) {
                    return Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 93,
                      height: 93,
                      child: Stack(
                        children: [
                          if (item.media != null && item.thumbnailPath == null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(
                                item.media!,
                                fit: BoxFit.cover,
                                height: 93,
                                width: double.infinity,
                              ),
                            )
                          else if (item.thumbnailPath != null &&
                              File(item.thumbnailPath!).existsSync())
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(
                                File(item.thumbnailPath!),
                                fit: BoxFit.cover,
                                height: 93,
                                width: double.infinity,
                              ),
                            ),
                          Positioned(
                            right: 6,
                            top: 6,
                            child: GestureDetector(
                              onTap: () => toggleActive(item),
                              child: item.isActive
                                  ? const AppIcon(AppIcons.check_circle)
                                  : Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xffFF6C29),
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList()
                else
                  const SizedBox(height: 93)
              ],
            ),
          ),
          if (!contentState.files.any((item) => item.isActive))
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: onAddMedia,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(15),
                  dashPattern: const [8, 4],
                  color: const Color(0xffFF6C29),
                  strokeWidth: 2,
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIcon(
                          AppIcons.camera_plus,
                          color: Color(0xffFF6C29),
                        ),
                        Gap(10),
                        Text(
                          'Выбрать из галереи',
                          style: TextStyle(
                            color: Color(0xffFF6C29),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          else
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              padding: const EdgeInsets.only(right: 15),
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFF6C29),
                  ),
                  onPressed: onPressed,
                  child: const Text(
                    'Загрузить выбранное',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
