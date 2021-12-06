import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_template/entries/app_version.dart';
import 'package:flutter_template/ui/widgets/upgrade_dialog.dart';
import 'package:flutter_template/utils/utils.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:r_upgrade/r_upgrade.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:version/version.dart';

class ApplicationController extends GetxController {
  static ApplicationController get to => Get.find();
  final pageIndex = 0.obs;

  final _version = ''.obs;

  get version => _version.value;

  set version(val) => _version.value = val;

  final _content = ''.obs;
  final _futureVersion = ''.obs;
  final _url = ''.obs;

  final RxnInt upgradeId = RxnInt();

  final RxString route = ''.obs;

  //获取系统版本
  getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _version.value = packageInfo.version;
  }

  Future<bool> needUpdate() async {
    if (!Verify.strNoEmpty(_version.value)) {
      await getVersion();
    }
    // Response<BaseResp<AppVersion>> resp = await HttpService.to.getVersion();
    Response resp = { } as Response;
    if (resp.body!.code != 200) {
      return false;
    } else {
      AppVersion data = resp.body!.data;
      Version _currentVersion = Version.parse(_version.value);
      Version _latestVersion = Version(1, 0, 0);
      if (Platform.isIOS) {
        _latestVersion = Version.parse(data.iosVersion);
        _content.value = data.iosVersionNote!;
        _url.value = data.iosDownloadUrl!;
        _futureVersion.value = data.iosVersion!;
      } else if (Platform.isAndroid) {
        _latestVersion = Version.parse(data.androidVersion);
        _content.value = data.androidVersionNote!;
        _url.value = data.androidDownloadUrl!;
        _futureVersion.value = data.androidVersion!;
      }
      return _latestVersion > _currentVersion;
    }
  }

  appUpgrade() async {
    bool _result = await needUpdate();
    if (_result) {
      Get.dialog(
        StreamBuilder<DownloadInfo>(
            stream: RUpgrade.stream,
            builder: (context, snapshot) {
              return UpgradeDialog(
                version: _futureVersion.value,
                content: _content.value,
                downloadInfo: snapshot.data,
                onPressed: () async {
                  if (Platform.isIOS) {
                    launch(_url.value);
                    Get.back();
                  } else if (Platform.isAndroid) {
                    if (snapshot.hasData) {
                      RUpgrade.install(upgradeId.value!);
                    } else {
                      upgradeId.value = await RUpgrade.upgrade(_url.value,
                          fileName:
                          'DRLink-${DateTime.now().millisecondsSinceEpoch}.apk',
                          isAutoRequestInstall: true,
                          notificationStyle:
                          NotificationStyle.speechAndPlanTime,
                          useDownloadManager: false);
                    }
                  }
                },
              );
            }),
        barrierDismissible: false,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    // this.appUpgrade();
  }
}
