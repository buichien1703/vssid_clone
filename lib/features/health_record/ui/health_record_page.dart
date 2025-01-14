import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vssid/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:vssid/features/src_feature.dart';
import 'package:vssid/gen/assets.gen.dart';

class HealthRecordPage extends BaseGetWidget<HealthRecordController> {
  const HealthRecordPage({super.key});
  @override
  Widget buildWidgets(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: PageScaffold(
        customAppBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.height * 0.3),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  // color: Colors.blue,
                  height: kToolbarHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SimpleButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          // color: Colors.white,
                        ),
                      ),
                      TextBuild(
                        title: HealthRecordStr.healthRecord.toUpperCase(),
                        fontSize: AppDimens.sizeTextLarge,
                        // textColor: Colors.white,
                      ),
                      const SizedBox.shrink()
                    ],
                  ).paddingSymmetric(
                    horizontal: AppDimens.defaultPadding,
                  ),
                ),
                UtilWidget.sizedBoxPadding,
                const UserInfoShort(),
                UtilWidget.sizedBoxPadding,
                TabBar(
                  controller: controller.tabController,
                  // automaticIndicatorColorAdjustment: true,
                  indicatorColor: Colors.black.withOpacity(0.2),
                  dividerColor: Colors.black.withOpacity(0.2),
                  indicator: const BoxDecoration(),
                  indicatorWeight: 1,
                  onTap: (index) {
                    controller.tabController.animateTo(index);
                  },
                  // isScrollable: true,

                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.blue,
                  labelPadding: const EdgeInsets.symmetric(
                      vertical: AppDimens.paddingVerySmall),
                  tabs: [
                    _tabItem(
                      HealthRecordStr.history,
                      svg: Assets.svg.history,
                    ),
                    _tabItem(
                      HealthRecordStr.giaycap,
                      svg: Assets.svg.history,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        child:
            TabBarView(controller: controller.tabController, children: const [
          BodyContent<HealthRecordHistoryTabController>.lichsu(),
          BodyContent<HealthRecordReleaseDocumentController>.giaycap(),
          // const Service(),
        ]),
      ),
    );
  }

  Widget _tabItem(
    String title, {
    SvgGenImage? svg,
    IconData? icon,
  }) {
    return SizedBox(
      width: 100.h,
      height: 100.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          svg != null
              ? svg.svg(
                  height: AppDimens.sizeIconLarge,
                  width: AppDimens.sizeIconLarge)
              : Icon(
                  icon,
                  size: AppDimens.sizeIconLarge,
                ),
          TextBuild(
            title: title,
            isAutoSizeText: true,
            fontSize: AppDimens.sizeTextVerySmall,
          )
        ],
      ),
    );
  }
}
