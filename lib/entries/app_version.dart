import 'dart:convert';
import 'base.dart';

class AppVersion {
  AppVersion({
    this.androidVersion,
    this.androidDownloadUrl,
    this.androidVersionNote,
    this.iosVersion,
    this.iosDownloadUrl,
    this.iosVersionNote,
  });

  factory AppVersion.fromJson(Map<String, dynamic> jsonRes) => AppVersion(
    androidVersion: asT<String?>(jsonRes['android_version']),
    androidDownloadUrl: asT<String?>(jsonRes['android_download_url']),
    androidVersionNote: asT<String?>(jsonRes['android_version_note']),
    iosVersion: asT<String?>(jsonRes['ios_version']),
    iosDownloadUrl: asT<String?>(jsonRes['ios_download_url']),
    iosVersionNote: asT<String?>(jsonRes['ios_version_note']),
  );

  String? androidVersion;
  String? androidDownloadUrl;
  String? androidVersionNote;
  String? iosVersion;
  String? iosDownloadUrl;
  String? iosVersionNote;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'android_version': androidVersion,
    'android_download_url': androidDownloadUrl,
    'android_version_note': androidVersionNote,
    'ios_version': iosVersion,
    'ios_download_url': iosDownloadUrl,
    'ios_version_note': iosVersionNote,
  };

  AppVersion clone() => AppVersion.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}
