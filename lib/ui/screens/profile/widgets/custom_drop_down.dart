import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.items,
      required this.selectedValue,
      required this.onSelected, this.color});

  final List<DropdownMenuItem<String>> items;
  final String selectedValue;
  final Function(String? value) onSelected;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        items: items,
        value: selectedValue,
        onChanged: onSelected,
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: color ??  Colors.black26,
            ),
          ),
        ),
        
        iconStyleData: const IconStyleData(
          icon: AppIcon(AppIcons.arrow_down_vertical),
          iconSize: 14,
        ),
        dropdownStyleData: DropdownStyleData(
          scrollPadding:EdgeInsets.zero,
          
          maxHeight: 200,
          width: 363,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
          offset: const Offset(0,0),
          scrollbarTheme: ScrollbarThemeData(
            thumbVisibility: WidgetStateProperty.all<bool>(false),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
            height: 50,
            padding: const EdgeInsets.only(left: 14, right: 14),
            overlayColor: WidgetStatePropertyAll(Colors.grey[100])),
      ),
    );
  }
}
