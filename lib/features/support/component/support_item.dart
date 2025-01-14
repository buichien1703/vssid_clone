import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vssid/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:vssid/features/src_feature.dart';
import 'package:vssid/gen/assets.gen.dart';

class SupportItem extends StatelessWidget {
  const SupportItem({
    super.key,
    required this.item,
  });

  final SupportComponentItemModel item;

  @override
  Widget build(BuildContext context) {
    return CardBuilder(
      elevation: 0,
      onTap: item.function,
      paddingModel: const PaddingModel(
          paddingVerical: AppDimens.paddingVerySmall,
          paddingHorizontal: AppDimens.defaultPadding),
      backgroundColor: Colors.blue.withOpacity(0.05),
      child: Row(
        children: [
          CardBuilder(
            height: 45.h,
            width: 45.h,
            backgroundColor: Colors.transparent,
            paddingModel:
                const PaddingModel(paddingAll: AppDimens.paddingVerySmall),
            radiusModel: const RadiusModel(radiusAll: 50),
            isBorder: true,
            borderColor: context.onSurfaceColor,
            child: item.pathSVG != null
                ? item.pathSVG!.svg()
                : Icon(
                    item.iconData,
                    color: context.onSurfaceColor,
                    size: AppDimens.sizeIconMedium,
                  ),
          ),
          UtilWidget.sizedBoxWidthPadding,
          Expanded(
            child: TextBuild(
              textAlign: TextAlign.start,
              isAutoSizeText: true,
              title: item.content.toUpperCase(),
              fontSize: AppDimens.sizeTextLarge,
            ),
          )
        ],
      ),
    );
  }
}
