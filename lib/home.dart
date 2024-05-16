import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pracfluttergetx/controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: GetBuilder<Controller>(
                builder: (controller) {
                  return ElevatedButton(
                    child: Text('${controller.counter}'),
                    // child: Text('${Get.find<Controller>().counter}'),
                    onPressed: () => controller.increment(),
                    );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReactiveHome extends StatelessWidget {
  const ReactiveHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReactiveController());
    return Scaffold(
      body: Center(
        child: Obx(() {
          return ElevatedButton(
            child: Text('${Get.find<ReactiveController>().counter.value}'),
            onPressed: () => Get.find<ReactiveController>().increment(),
          );

        })
      )
    );
  }
}