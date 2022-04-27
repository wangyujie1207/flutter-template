import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_ios/types/auth_messages_ios.dart';
import 'package:local_auth_android/types/auth_messages_android.dart';
class LocalAuth {
  static LocalAuth? _instance;

  LocalAuth._();

  late LocalAuthentication auth;

  factory LocalAuth() {
    _instance ??= LocalAuth._();
    return _instance!;
  }

  init() {
    auth = LocalAuthentication();
  }

  /// 检查是否有可用的生物识别技术
  Future<bool> checkBiometrics() async {
    try {
      bool canCheckBiometrics = await auth.canCheckBiometrics;
      return canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    return false;
  }

  /// 获取生物识别技术列表
  Future<List<BiometricType>?> getAvailableBiometrics() async {
    try {
      List<BiometricType> availableBiometrics =
      await auth.getAvailableBiometrics();
      return availableBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
  }

  /// 生物识别
  Future<bool> authenticate() async {
    AndroidAuthMessages androidStrings = AndroidAuthMessages(
      signInTitle: 'authTitle'.tr,
      goToSettingsDescription: 'authDesc'.tr,
      goToSettingsButton: 'authSettingBtn'.tr,
      cancelButton: 'cancel'.tr,
      biometricSuccess: 'authSuccess'.tr,
      biometricRequiredTitle: 'authRequiredTitle'.tr,
      biometricNotRecognized: 'authFail'.tr,
      biometricHint: 'authName'.tr,
    );
    IOSAuthMessages iosStrings = IOSAuthMessages(
      goToSettingsDescription: 'authDesc'.tr,
      goToSettingsButton: 'authSettingBtn'.tr,
      cancelButton: 'cancel'.tr,
      lockOut: 'authLock'.tr,
    );
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'authReason'.tr,
        authMessages: [iosStrings, androidStrings],
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          biometricOnly: true,
          stickyAuth: false,
        ),
      );
      return authenticated;
    } on PlatformException catch (e) {
      return false;
    }
    // return false;
  }
}
