import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/lang/lang_service.dart';
import 'package:flutter_template/ui/helper/size_box_entension.dart';
import 'package:r_upgrade/r_upgrade.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpgradeDialog extends StatelessWidget {
  final String version;
  final String? content;
  final GestureTapCallback onPressed;
  final DownloadInfo? downloadInfo;

  const UpgradeDialog(
      {Key? key,
      required this.version,
      this.content,
      required this.onPressed,
      this.downloadInfo})
      : super(key: key);

  DownloadStatus? get status => downloadInfo?.status;

  double? get percent => downloadInfo?.percent;

  Widget _versionWidget(context) {
    return Positioned(
      left: 200.w,
      top: 180.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.w),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(14.w)),
        child: Text(
          version,
          style: TextStyle(fontSize: 25.sp, color: Colors.white),
        ),
      ),
    );
  }

  Widget _bg() {
    return Positioned(
      left: 0,
      top: -30.w,
      child: ExtendedImage.asset(
        LangService.to.localValue == 1
            ? 'assets/images/common/upgrade.png'
            : 'assets/images/common/upgrade_en.png',
        width: 635.w,
        height: 320.w,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Center(
          child: UnconstrainedBox(
        child: Material(
          color: Colors.transparent,
          child: Stack(
            fit: StackFit.loose,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14.w),
                child: Container(
                  width: 635.w,
                  color: context.isDarkMode
                      ? const Color(0xff20232C)
                      : Colors.white,
                  padding: EdgeInsets.only(bottom: 45.w),
                  child: Column(
                    children: [
                      320.w.vb,
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'UpdateReminder'.tr,
                              style: TextStyle(
                                  fontSize: 33.sp,
                                  color: context.isDarkMode
                                      ? const Color(0xffE0E0E0)
                                      : const Color(0xff161616),
                                  fontWeight: FontWeight.bold),
                            ),
                            10.w.vb,
                            Text(
                              content ??
                                  '1.${'FixKnownIssues'.tr}\n2.${'OptimizeUserExperience'.tr}',
                              style: TextStyle(
                                  fontSize: 29.sp,
                                  color: context.isDarkMode
                                      ? const Color(0xff9C9C9C)
                                      : const Color(0xff1E1E1E)),
                            ),
                            if (status != DownloadStatus.STATUS_FAILED) 45.w.vb,
                            if (percent != null &&
                                status != DownloadStatus.STATUS_SUCCESSFUL &&
                                status != DownloadStatus.STATUS_FAILED)
                              Container(
                                width: 600.w,
                                height: 80.w,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        value: (percent ?? 0) / 100,
                                        backgroundColor:
                                            Colors.grey.withAlpha(33),
                                        valueColor: AlwaysStoppedAnimation(
                                            Theme.of(context).primaryColor),
                                      ),
                                    ),
                                    Container(
                                      width: 100.w,
                                      margin: EdgeInsets.only(left: 10.w),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "$percent %",
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            if (status == DownloadStatus.STATUS_FAILED)
                              Container(
                                width: 600.w,
                                height: 125.w,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'failTips'.tr,
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      color: const Color(0xffD1514B)),
                                ),
                              ),
                            if (status == DownloadStatus.STATUS_SUCCESSFUL)
                              _Button(
                                title: 'installNow'.tr,
                                onTap: onPressed,
                              ),
                            if (downloadInfo == null)
                              _Button(
                                title: 'UpdateNow'.tr,
                                onTap: onPressed,
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              _bg(),
              _versionWidget(context),
            ],
          ),
        ),
      )),
    );
  }
}

class _Button extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;

  const _Button({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 600.w,
        height: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.w),
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 31.sp, color: const Color(0xff333333)),
        )),
      ),
    );
  }
}
