import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../l10n/strings.dart';

Future<DateTime?> showDatePickerBottomSheet(
  BuildContext context,
) async {
  DateTime dateTime = DateTime.now();
  return showCupertinoModalPopup<DateTime?>(
    context: context,
    builder: (context) => CupertinoActionSheet(
      actions: [
        SizedBox(
          height: 250,
          child: CupertinoDatePicker(
            minimumYear: 1900,
            maximumYear: DateTime.now().year,
            initialDateTime: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (dt) {
              dateTime = dt;
            },
          ),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(Strings.of(context).save),
        onPressed: () {
          Navigator.pop(context, dateTime);
        },
      ),
    ),
  );
}

Future<T?> showCupertinoPicker<T>({
  required BuildContext context,
  double? itemExtent,
  required List<T> list,
  required T? selectedValue,
}) async {
  T? selectedItem = selectedValue;

  return showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      actions: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: CupertinoPicker.builder(
            childCount: list.length,
            itemExtent: itemExtent ?? 30,
            scrollController: FixedExtentScrollController(
              initialItem: list.indexOf(selectedValue as T),
            ),
            onSelectedItemChanged: (index) {
              selectedItem = list[index];
            },
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  list[index].toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              );
            },
          ),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(Strings.of(context).save),
        onPressed: () => Navigator.pop(context, selectedItem),
      ),
    ),
  );
}

Future<ImageSource?> showSelectImageSourceBottomSheet({
  required BuildContext context,
}) {
  return showCupertinoModalPopup<ImageSource>(
    context: context,
    builder: (context) => CupertinoActionSheet(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => Navigator.pop(context, ImageSource.camera),
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Strings.of(context).camera,
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 10),
                Icon(
                  CupertinoIcons.camera,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          const SizedBox(width: 50),
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Strings.of(context).gallery,
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 10),
                Icon(
                  CupertinoIcons.photo,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
      cancelButton: CupertinoActionSheetAction(
        child: Text(Strings.of(context).cancel),
        onPressed: () => Navigator.pop(context),
      ),
    ),
  );
}


