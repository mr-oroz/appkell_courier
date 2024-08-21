import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:appkel_for_courier_flutter/data/models/product_model.dart';
import 'package:appkel_for_courier_flutter/hooks/use_form_key.dart';
import 'package:appkel_for_courier_flutter/providers/content_providers.dart';
import 'package:appkel_for_courier_flutter/providers/product_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/registration/widgets/custom_text_form_field.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/widgets/add_content_sheet.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/widgets/custom_drop_down.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';

class AddDishProductSheet extends HookConsumerWidget {
  const AddDishProductSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carouselController = CarouselSliderController();
    final titleCtrl = useTextEditingController();
    final caloriesCtrl = useTextEditingController();
    final priceCtrl = useTextEditingController();
    final descriptionCtrl = useTextEditingController();
    final categoryProvider = useMemoized(() => categoryDishListProvider(), []);
    final categories = ref.watch(categoryProvider);
    final categoryItems = useState<List<DropdownMenuItem<String>>>([]);
    final selectedCategory = useState<String?>(null);
    final formKey = useFormKey();
    final images = useState<List<File>>([]);
    final count = useState(0);
    final isLoading = useState<bool>(false);

    void addImage() async {
      final files = ref.watch(contentProvidersProvider).files;
      final a =
          files.map((item) => item.media).whereType<File>().toSet().toList();
      images.value = a;
    }

    void onSelected(String? value) {
      selectedCategory.value = value!;
    }

    int? getCategoryIdById(String id) {
      try {
        final category = categories.asData!.value.firstWhere(
          (category) => category.id.toString() == id,
        );
        return category.id;
      } catch (e) {
        return null;
      }
    }

    useEffect(() {
      if (categories.asData != null) {
        final items = categories.asData!.value.map((category) {
          return DropdownMenuItem<String>(
            value: category.id.toString(),
            child: Text(category.categoryName!),
          );
        }).toList();

        categoryItems.value = items;

        if (selectedCategory.value == null && items.isNotEmpty) {
          selectedCategory.value = items.first.value;
        } else if (!items
            .map((item) => item.value)
            .contains(selectedCategory.value)) {
          selectedCategory.value = items.isNotEmpty ? items.first.value : null;
        }
      }
      return null;
    }, [categories]);

    final currentIndex = useState(0);
    return DraggableScrollableSheet(
      initialChildSize: 0.99,
      minChildSize: 0.6,
      maxChildSize: 1,
      expand: false,
      builder: (_, controller) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              controller: controller,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Gap(15),
                    Stack(
                      children: [
                        CarouselSlider(
                          carouselController: carouselController,
                          options: CarouselOptions(
                            height: 363,
                            aspectRatio: 1,
                            viewportFraction: 1,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) {
                              currentIndex.value = index;
                            },
                          ),
                          items: images.value.map((image) {
                            return Builder(
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: FileImage(image),
                                          fit: BoxFit.cover),
                                      color: const Color(0xFFF1F1F1),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        Positioned(
                          top: 10,
                          right: 20,
                          child: IconButton(
                            icon: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width / 5),
                              ),
                              child: const Center(child: Icon(Icons.close)),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 20,
                          child: IconButton(
                            icon: Container(
                              width: 57,
                              height: 57,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width / 5),
                                  border: Border.all(
                                      color: const Color(0xffFF6C29))),
                              child: const Center(
                                child: AppIcon(
                                  AppIcons.camera_plus,
                                  color: Color(0xffFF6C29),
                                ),
                              ),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.white,
                                useRootNavigator: true,
                                builder: (context) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                    left: 15,
                                  ),
                                  child: AddContentSheet(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      addImage();
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: images.value.asMap().entries.map((entry) {
                        return Container(
                          width: 7,
                          height: 7,
                          margin: const EdgeInsets.only(right: 5, top: 15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (currentIndex.value == entry.key)
                                ? const Color(0xFFFF6C29)
                                : const Color(0xFFD9D9D9),
                          ),
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Добавьте название',
                            style: TextStyle(
                              color: Color(0xFFFF6C29),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          const Gap(6),
                          CustomTextFormField(
                            controller: titleCtrl,
                            color: Theme.of(context).primaryColor,
                            radius: 15,
                            onChanged: (value) {
                              count.value++;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Введите название';
                              }
                              return null;
                            },
                          ),
                          const Gap(15),
                          Row(
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Калорийность',
                                      style: TextStyle(
                                        color: Color(0xFFFF6C29),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    const Gap(6),
                                    CustomTextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: caloriesCtrl,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Введите Калорийность';
                                        }
                                        return null;
                                      },
                                      color: Theme.of(context).primaryColor,
                                      radius: 15,
                                      onChanged: (value) {
                                        count.value++;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(27),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Цена товара',
                                      style: TextStyle(
                                        color: Color(0xFFFF6C29),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    const Gap(6),
                                    CustomTextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: priceCtrl,
                                      color: Theme.of(context).primaryColor,
                                      radius: 15,
                                      onChanged: (value) {
                                        count.value++;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Введите цену';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const Gap(20),
                          const Text(
                            'Добавьте категорию',
                            style: TextStyle(
                              color: Color(0xFFFF6C29),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          const Gap(6),
                          CustomDropDown(
                            color: Theme.of(context).primaryColor,
                            items: categoryItems.value,
                            selectedValue: selectedCategory.value!,
                            onSelected: onSelected,
                          ),
                          const Gap(20),
                          const Text(
                            'Добавьте описание товара',
                            style: TextStyle(
                              color: Color(0xFFFF6C29),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          const Gap(6),
                          CustomTextFormField(
                            controller: descriptionCtrl,
                            color: Theme.of(context).primaryColor,
                            radius: 15,
                            onChanged: (value) {
                              count.value++;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Введите описанию';
                              }
                              return null;
                            },
                            maxLines: 4,
                          ),
                          const Gap(15),
                          SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: !isLoading.value
                                  ? const Text(
                                      'Добавить товар',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    )
                                  : const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    ),
                              onPressed: () async {
                                if (formKey.currentState!.validate() &&
                                    titleCtrl.text.isNotEmpty &&
                                    priceCtrl.text.isNotEmpty &&
                                    caloriesCtrl.text.isNotEmpty &&
                                    descriptionCtrl.text.isNotEmpty &&
                                    images.value.isNotEmpty &&
                                    selectedCategory.value != null) {
                                  int calories =
                                      int.tryParse(caloriesCtrl.text) ?? 0;
                                  int price = int.tryParse(priceCtrl.text) ?? 0;
                                  int? categoryId =
                                      int.tryParse(selectedCategory.value!);
                                  final response = await ref.read(
                                    addDishProvider(
                                      product: DishProductModel(
                                          title: titleCtrl.text,
                                          calories: calories,
                                          price: price,
                                          category: categoryId,
                                          composition: descriptionCtrl.text),
                                      images: images.value,
                                    ).future,
                                  );
                                  if (!context.mounted) return;
                                  if (response != null &&
                                      response.isSuccessful) {
                                    Navigator.pop(context);
                                    ref
                                        .read(contentProvidersProvider.notifier)
                                        .clearImages();
                                    ref.refresh(dishProductsListProvider());
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Что то пошло не так'),
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const Gap(30),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
