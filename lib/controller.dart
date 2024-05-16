import 'package:get/get.dart';

class Controller extends GetxController {
  Controller() : super();
  int counter = 0;

  void increment() {
    counter++;
    update();
  }
}

class ReactiveController extends GetxController {
  static ReactiveController get to => Get.find();
  RxInt counter = 0.obs;

  @override
  void onInit() {
  @override
    once(counter, (_) {
      print('$_ has been changed first time');
    });
    ever(counter, (_) {
      print('$_ has been changed');
    });
    debounce(
      counter,
      (_) {
        print('$_ has maintained the same value for 10 second');
      },
      time: Duration(seconds: 10),
    );
    interval(
      counter,
      (_) {
        print('$_ has maintained the same value for 1 second');
      },
      time: Duration(seconds: 1),
    );
    super.onInit();
  }
  void onClose() {

  }

  void increment() {
    counter++;
  }
}
