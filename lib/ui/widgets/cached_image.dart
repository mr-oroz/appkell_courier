import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../config/theme/theme.dart';
import 'app_icon.dart';

// TODO: Сделать более гибким и переиспользуемым, например, добавить возможность
//указывать placeholder и errorWidget и название класса отличается от названия файла
class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    this.fit,
    this.width,
    this.height,
    this.borderRadius,
    this.imageUrl,
    this.errorWidget,
    this.placeholder,
  });

  final BoxFit? fit;
  final double? width;
  final double? height;
  final String? imageUrl;
  final Widget? errorWidget;
  final Widget? placeholder;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: CachedNetworkImage(
        width: width,
        height: height,
        maxWidthDiskCache: 1500,
        maxHeightDiskCache: 1500,
        imageUrl: imageUrl ?? '',
        fit: fit ?? BoxFit.cover,
        placeholder: (context, url) =>
            placeholder ??
            Container(
              width: width,
              height: height,
              color: Colors.transparent,
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: LoadingIndicator(
                    indicatorType: Indicator.lineSpinFadeLoader,
                    colors: [Theme.of(context).primaryColor],
                  ),
                ),
              ),
            ),
        errorWidget: (context, url, error) {
          return SizedBox(
            width: width,
            height: height,
            child: errorWidget ??
                Icon(
                  Icons.error_outline,
                  color: AppTheme.defaultTheme.mainTextColor,
                ),
          );
        },
      ),
    );
  }
}
