import 'dart:async';
import 'package:appkel_for_courier_flutter/data/models/search_location_model.dart';
import 'package:appkel_for_courier_flutter/providers/auth_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/registration/widgets/custom_text_form_field.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationSearchScreen extends HookConsumerWidget {
  const LocationSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressController = useTextEditingController();
    final updateState = useState<List<SearchLocationModel>>([]);
    Timer? debounce;

    void performSearch(String query) {
      if (debounce?.isActive ?? false) debounce!.cancel();
      debounce = Timer(const Duration(milliseconds: 500), () async {
        if (query.isEmpty) {
          updateState.value = [];
        } else {
          final results = await ref
              .read(searchLocationProvider(query).notifier)
              .build(query);
          updateState.value = results;
        }
      });
    }

    useEffect(() {
      return () {
        debounce?.cancel();
      };
    }, []);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const AppIcon(AppIcons.arrow_down),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: CustomTextFormField(
          radius: 15,
          hintText: 'Поиск адреса',
          controller: addressController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Введите адрес';
            }
            return null;
          },
          onChanged: (value) => performSearch(value),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(15),
          itemCount: updateState.value.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = updateState.value[index];
            return InkWell(
              onTap: () {
                ref.read(authProvider.notifier).setAddress(
                      item.displayName ?? '',
                      lat: item.lat ?? '',
                      lon: item.lon ?? '',
                    );
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.displayName ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF222222),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Gap(10),
        ),
      ),
    );
  }
}