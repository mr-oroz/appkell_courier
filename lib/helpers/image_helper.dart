import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  static Future<File?> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null && Platform.isIOS) {
      return await cropImage(File(pickedFile.path));
    }
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  static Future<File?> pickVideo(ImageSource source) async {
    final pickedFile = await ImagePicker().pickVideo(source: source);
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  static Future<File?> cropImage(File imageFile) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(),
      ],
    );
    return croppedImage != null ? File(croppedImage.path) : null;
  }

  static Future<File?> pickImageFromSource(BuildContext context) async {
    File? pickedImage;
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    pickedImage = await pickImage(ImageSource.gallery);
                    if (!context.mounted) return;
                    Navigator.pop(context);
                  },
                  child: const ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Галерея'),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    pickedImage = await pickImage(ImageSource.camera);
                    if (!context.mounted) return;
                    Navigator.pop(context);
                  },
                  child: const ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Камера'),
                  ),
                ),
              ],
            ),
          );
        });
    return pickedImage;
  }

  static Future<File?> pickMediaFromSource(BuildContext context) async {
    File? pickedMedia;
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Галерея (Фото или Видео)'),
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Wrap(
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.photo),
                              title: const Text('Фото'),
                              onTap: () async {
                                pickedMedia =
                                    await pickImage(ImageSource.gallery);
                                if (!context.mounted) return;
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.video_library),
                              title: const Text('Видео'),
                              onTap: () async {
                                pickedMedia =
                                    await pickVideo(ImageSource.gallery);
                                if (!context.mounted) return;
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  if (!context.mounted) return;
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Камера (Фото или Видео)'),
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Wrap(
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.photo_camera),
                              title: const Text('Фото'),
                              onTap: () async {
                                pickedMedia =
                                    await pickImage(ImageSource.camera);
                                if (!context.mounted) return;
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.videocam),
                              title: const Text('Видео'),
                              onTap: () async {
                                pickedMedia =
                                    await pickVideo(ImageSource.camera);
                                if (!context.mounted) return;
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  if (!context.mounted) return;
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
    return pickedMedia;
  }
}
