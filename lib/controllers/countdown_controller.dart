import 'dart:async';

import 'package:cherry_request/cherry_request.dart';
import 'package:get/get.dart';

import '../utils/toast.dart';

abstract class CountdownController extends GetxController{
  Timer? _timer;

  final _count = 0.obs;
  get count => _count.value;
  set count(val) => _count.value = val;

  final _countdownLoading = false.obs;
  get countdownLoading => _countdownLoading.value;
  set countdownLoading(val) => _countdownLoading.value = val;

  int _maxCount = 60;

  CountdownController({int? maxCount}){
    if(maxCount != null){
      _maxCount = maxCount;
    }
  }

  Future<ResponseEntity<Map>> getCode(String account);

  handlerCountdown(String account) async{
    if(_count.value > 0) return;
    _countdownLoading.value = true;
    try{
      var resp = await getCode(account);
      showToast(resp.message);
      _start();
    }on HttpException catch(e){
      showToast(e.message);
      _timer?.cancel();
      _count.value = 0;
    }finally{
      _countdownLoading.value = false;
    }
  }

  void _start() {
    _count.value = _maxCount;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _count.value--;
      if (_count < 1) {
        _timer?.cancel();
        _count.value = 0;
      }
    });
  }

  close(){
    _timer?.cancel();
    _count.value = 0;
  }

  @override
  void onClose() {
    _timer?.cancel();
    _count.value = 0;
    super.onClose();
  }
}