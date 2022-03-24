import 'package:flutter/material.dart';
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

  Widget _bg() {
    return Image.asset(
      'assets/images/common/upgrade.png',
      width: 550.w,
      height: 730.w,
      fit: BoxFit.fill,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>  Future.value(false),
      child: Center(
          child: UnconstrainedBox(
            child: Material(
              color: Colors.transparent,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  _bg(),
                  Container(
                    width: 550.w,
                    height: 730.w,
                    padding: EdgeInsets.only(bottom: 45.w),
                    child: Column(
                      children: [
                        Container(
                          width: 550.w,
                          height: 360.w,
                          padding: EdgeInsets.only(left: 30.w, top: 90.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'findNew'.tr,
                                style: TextStyle(
                                    fontSize: 46.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              10.w.vb,
                              Text(
                                version,
                                style: TextStyle(
                                    fontSize: 26.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              alignment: Alignment.topLeft,
                              child: Text(
                                content ?? '',
                                style: TextStyle(
                                    fontSize: 26.sp,
                                    color: const Color(0xff555555),
                                    height: 1.8
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (status != DownloadStatus.STATUS_FAILED) 45.w.vb,
                              if (percent != null &&
                                  status != DownloadStatus.STATUS_SUCCESSFUL &&
                                  status != DownloadStatus.STATUS_FAILED)
                                SizedBox(
                                  width: 490.w,
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
                                  width: 490.w,
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
                  // _versionWidget(context),
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

  const _Button({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 490.w,
        height: 80.w,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/common/upgrade_btn.png'),
                fit: BoxFit.fill)),
        child: Text(
          title,
          style: TextStyle(fontSize: 32.sp, color: Colors.white, height: 1),
        ),
      ),
    );
  }
}
