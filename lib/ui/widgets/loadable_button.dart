import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadableButton extends StatelessWidget {
  const LoadableButton({
    Key? key,
    this.onPressed,
    this.loading = false,
    required this.title,
    this.buttonColor,
    this.minimumSize,
    this.maximumSize,
    this.titleColor,
    this.indicatorType,
    this.indicatorSize,
  }) : super(key: key);

  final String title;
  final bool loading;
  final Color? buttonColor;
  final Function()? onPressed;
  final double? minimumSize;
  final double? maximumSize;
  final Color? titleColor;
  final Indicator? indicatorType;
  final double? indicatorSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: ElevatedButton(
        key: ValueKey(loading),
        onPressed: loading ? null : onPressed,
        style: ButtonStyle(
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
          maximumSize: MaterialStatePropertyAll(
            Size.fromWidth(maximumSize ?? double.infinity),
          ),
          minimumSize: MaterialStatePropertyAll(
            Size.fromHeight(minimumSize ?? 55),
          ),
          elevation: const MaterialStatePropertyAll(0.0),
          backgroundColor: MaterialStatePropertyAll(
            buttonColor ?? Theme.of(context).primaryColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loading
                ? AnimatedOpacity(
                    opacity: loading ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: SizedBox(
                        width: indicatorSize ?? 20,
                        height: indicatorSize ?? 20,
                        child: LoadingIndicator(
                          indicatorType:
                              indicatorType ?? Indicator.lineSpinFadeLoader,
                        ),
                      ),
                    ),
                  )
                : Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: titleColor ?? Colors.white,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
