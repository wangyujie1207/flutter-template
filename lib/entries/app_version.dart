import 'dart:convert';
import 'base.dart';

class AppVersion {
  AppVersion({
    this.androidForce,
    required this.androidVersion,
    this.androidDownloadUrl,
    this.androidVersionNote,
    this.iosForce,
    required this.iosVersion,
    this.iosDownloadUrl,
    this.iosVersionNote,
  });

  factory AppVersion.fromJson(Map<String, dynamic> json) => AppVersion(
    androidForce: asT<double?>(json['android_force']),
    androidVersion: asT<String?>(json['android_version'])!,
    androidDownloadUrl: asT<String?>(json['android_download_url']),
    androidVersionNote: asT<String?>(json['android_version_note']),
    iosForce: asT<double?>(json['ios_force']),
    iosVersion: asT<String>(json['ios_version'])!,
    iosDownloadUrl: asT<String?>(json['ios_download_url']),
    iosVersionNote: asT<String?>(json['ios_version_note']),
  );

  double? androidForce;
  String androidVersion;
  String? androidDownloadUrl;
  String? androidVersionNote;
  double? iosForce;
  String iosVersion;
  String? iosDownloadUrl;
  String? iosVersionNote;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'android_force': androidForce,
    'android_version': androidVersion,
    'android_download_url': androidDownloadUrl,
    'android_version_note': androidVersionNote,
    'ios_force': iosForce,
    'ios_version': iosVersion,
    'ios_download_url': iosDownloadUrl,
    'ios_version_note': iosVersionNote,
  };
}
