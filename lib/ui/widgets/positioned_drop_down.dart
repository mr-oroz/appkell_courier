import 'package:flutter/material.dart';
import 'app_icon.dart';

class PositionedDropDown extends StatelessWidget {
  const PositionedDropDown({
    super.key,
    this.onSelected,
    required this.list,
    this.suffixIcon = false,
    this.width,
  });

  final List list;
  final bool suffixIcon;
  final Function(String)? onSelected;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: const [
          BoxShadow(
            color: Color(0x26474747),
            blurRadius: 5,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          final isLast = index == list.length - 1;
          final isFirst = index == 0;
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                onSelected?.call(item);
                FocusManager.instance.primaryFocus?.unfocus();
              },
              borderRadius: BorderRadius.only(
                topLeft: isFirst ? const Radius.circular(10) : Radius.zero,
                topRight: isFirst ? const Radius.circular(10) : Radius.zero,
                bottomLeft: isLast ? const Radius.circular(10) : Radius.zero,
                bottomRight: isLast ? const Radius.circular(10) : Radius.zero,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: isFirst ? 16 : 11,
                  bottom: isLast ? 16 : 11,
                  left: 20,
                  right: 23,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (item != null)
                      RichText(
                        text: TextSpan(
                          text: item,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      )
                    else
                      Text(
                        item,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    suffixIcon
                        ? const AppIcon(AppIcons.arrow_down)
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
