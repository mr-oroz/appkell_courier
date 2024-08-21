import 'dart:io';

import 'package:appkel_for_courier_flutter/providers/content_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/registration/widgets/custom_text_form_field.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/content_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/widgets/attach_the_platter_sheet.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddContentDescriptionSheet extends HookConsumerWidget {
  const AddContentDescriptionSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dishId = useState<String?>(null);
    final images = ref.watch(contentProvidersProvider).files;
    final descCtrl = useTextEditingController();
    final isLoading = useState(false);

    final filterImages = images.where((item) => item.isActive == true).toList();
    final imageFiles =
        filterImages.map((item) => item.media).whereType<File>().toList();
        
    void onSelected(String dish) {
      dishId.value = dish;
    }

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 15,
        right: 15,
      ),
      child: SafeArea(
        child: Wrap(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                width: 54,
                height: 2,
                color: const Color(0xFFD9D9D9),
              ),
            ),
            Container(margin: const EdgeInsets.only(top: 20)),
            const Text(
              'Добавьте описание товара',
              style: TextStyle(
                color: Color(0xFFFF6C29),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(margin: const EdgeInsets.only(bottom: 6)),
            CustomTextFormField(
              controller: descCtrl,
              color: const Color(0xFFFF6C29),
              obscureText: false,
              maxLines: 4,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  useRootNavigator: true,
                  context: context,
                  backgroundColor: Colors.white,
                  builder: (context) =>
                      AttachThePlatter(onSelected: onSelected),
                );
              },
              child: Container(
                height: 45,
                margin: const EdgeInsets.only(top: 16),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xB2FF6C29)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (dishId.value != null) ...[
                      const AppIcon(AppIcons.check_circle),
                      const Gap(10),
                      const Text(
                        'Блюдо прикреплено',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFFF6C29),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ] else ...[
                      const Icon(Icons.add, color: Color(0xFFFF6C29)),
                      const Gap(10),
                      const Text(
                        'Прикрепить блюдо',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFFF6C29),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFF6C29),
                  ),
                  child: isLoading.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : const Text(
                          'Загрузить выбранное',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                  onPressed: () async {
                    if (imageFiles.isNotEmpty &&
                        dishId.value != null &&
                        descCtrl.text.isNotEmpty) {
                      isLoading.value = true;
                      final res = await ref.read(createReelsProvider(
                        files: imageFiles,
                        description: descCtrl.text,
                        dishId: dishId.value,
                      ).future);
                      if (res != null && res.isSuccessful) {
                        isLoading.value = false;
                        ref
                            .read(contentProvidersProvider.notifier)
                            .clearImages();
                        ref.refresh(myReelsProvider());
                        dishId.value = null;
                        descCtrl.clear();
                        Navigator.push(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ContentScreen(),
                          ),
                        );
                      } else {
                        isLoading.value = false;
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
