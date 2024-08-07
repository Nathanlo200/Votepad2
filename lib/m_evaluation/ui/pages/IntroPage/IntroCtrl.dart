
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../m_user/business/interactor/UserInteractor.dart';
import '../../../../m_user/business/model/Authenticate.dart';
import '../../../business/interactor/EvaluationInteractor.dart';
import 'IntroState.dart';

part "IntroCtrl.g.dart";

@Riverpod(keepAlive: true)
class IntroCtrl extends _$IntroCtrl {
  @override
  IntroState build() {
    return IntroState();
  }

  Future<String?> soumettre(String coupon) async {
    var usecase = ref.watch(evaluationInteractorProvider).getJuryNetworkUseCase;
    state = state.copyWith(isLoading: true);
    try {
      var res = await usecase.run(coupon, state.imei);
      state = state.copyWith(isLoading: false);
      print("res ${res?.toJson()}");
      return null;
    }catch (e){
      return e.toString();
    }

  }

  void getDeviceIdentifier() async {
    String? deviceIdentifier = "";
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceIdentifier = androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceIdentifier = iosInfo.identifierForVendor;
    } else if (kIsWeb) {
      // The web doesnt have a device UID, so use a combination fingerprint as an example
      WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
      deviceIdentifier = webInfo.vendor.toString() +( webInfo.userAgent??"")+ webInfo.hardwareConcurrency.toString();
    } else if (Platform.isLinux) {
      LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
      deviceIdentifier = linuxInfo.machineId;
    }

    state = state.copyWith(imei: deviceIdentifier);
    print("deviceIdentifier $deviceIdentifier");
  }
}