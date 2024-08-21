import 'package:flutter/cupertino.dart';

import '../../l10n/strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// TODO: зачем выводить каждый bottomSheet в отдельный файл?
Future<T?> bottomSheetCupertinoPicker<T>({
  required BuildContext context,
  double? itemExtent,
  required List<T> list,
  required T? selectedValue,
  Function(int)? onChanged,
}) async {
  T? selectedItem = selectedValue;

  return showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      actions: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: CupertinoPicker(
            itemExtent: itemExtent ?? 30,
            scrollController: FixedExtentScrollController(
              initialItem: list.indexOf(selectedValue as T),
            ),
            onSelectedItemChanged: (index) {
              onChanged?.call(index);
              selectedItem = list[index];
            },
            children: list
                .map(
                  (e) => Center(
                    child: Text(
                      e.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
                .toList(),
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
