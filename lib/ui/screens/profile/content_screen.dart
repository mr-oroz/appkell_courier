import 'dart:async';
import 'dart:io';

import 'package:appkel_for_courier_flutter/helpers/cross_axis_count.dart';
import 'package:appkel_for_courier_flutter/providers/content_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/widgets/add_content_desc_sheet.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/widgets/add_content_sheet.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ContentScreen extends HookConsumerWidget {
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollCtrl = useScrollController();

    final contents = ref.watch(myReelsProvider());

    scrollCtrl.addListener(() {
      if (scrollCtrl.position.pixels == scrollCtrl.position.maxScrollExtent) {}
    });

    Future<String?> _generateThumbnail(String media) async {
      try {
        return await VideoThumbnail.thumbnailFile(
          video: media,
          imageFormat: ImageFormat.PNG,
          quality: 75,
          maxHeight: 93,
        );
      } catch (e) {
        print('Error generating thumbnail: $e');
        return null; // Handle error or return a default image path
      }
    }

    bool _isVideo(String filePath) {
      return filePath.endsWith('.mp4') ||
          filePath.endsWith('.mov') ||
          filePath.endsWith('.avi');
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const AppIcon(AppIcons.arrow_down),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Фото, видео',
          style: TextStyle(
            color: Color(0xFF222222),
            fontSize: 18,
            fontFamily: 'Helvetica',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFFF6C29)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcon(
                        AppIcons.camera_plus,
                        color: Color(0xFFFF6C29),
                      ),
                      Gap(10),
                      Text(
                        'Добавить фото, видео',
                        style: TextStyle(
                          color: Color(0xFFFF6C29),
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      useRootNavigator: true,
                      builder: (context) => Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                          left: 15,
                        ),
                        child: AddContentSheet(
                          onPressed: () {
                            Navigator.pop(context);
                            showModalBottomSheet(
                              useRootNavigator: true,
                              context: context,
                              backgroundColor: Colors.white,
                              builder: (context) =>
                                  const AddContentDescriptionSheet(),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(child: Gap(15)),
            SliverFillRemaining(
                child: contents.when(
                    data: (data) {
                      return GridView.builder(
                        controller: scrollCtrl,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemCount: data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: calculateCrossAxisCount(context, 118),
                          mainAxisExtent: 128,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          final item = data[index];
                          if (_isVideo(item.file.toString())) {
                            return FutureBuilder<String?>(
                              future: _generateThumbnail(item.file.toString()),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: LoadingIndicator(
                                        indicatorType:
                                            Indicator.lineSpinFadeLoader,
                                        colors: [
                                          Theme.of(context).primaryColor
                                        ],
                                      ),
                                    ),
                                  );
                                } else if (snapshot.hasData) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.file(
                                      File(snapshot.data!),
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                } else {
                                  return const Center(
                                      child: Text('Ошибка загрузки миниатюры'));
                                }
                              },
                            );
                          } else {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: CachedImage(
                                  imageUrl: item.file,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                    error: (error, stackTrace) => const SizedBox(),
                    loading: () => const SizedBox()))
          ],
        ),
      ),
    );
  }
}
