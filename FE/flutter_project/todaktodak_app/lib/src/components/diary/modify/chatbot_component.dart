import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:test_app/main.dart';
import 'package:test_app/src/config/mode.dart';
import 'package:test_app/src/controller/diary/diary_modify_controller.dart';

class ChatBotComponent extends StatelessWidget {
  const ChatBotComponent({super.key});
  Widget Emotion(var emotion) {
    switch (emotion) {
      case 0:
        return Image.asset(Get.find<ModifyController>().images[0].imagePath!);

      case 1:
        return Image.asset(
            Get.find<ModifyController>().images[emotion - 1].imagePath!);
      case 2:
        return Image.asset(
            Get.find<ModifyController>().images[emotion - 1].imagePath!);
      case 3:
        return Image.asset(
            Get.find<ModifyController>().images[emotion - 1].imagePath!);
      case 4:
        return Image.asset(
            Get.find<ModifyController>().images[emotion - 1].imagePath!);
      case 5:
        return Image.asset(
            Get.find<ModifyController>().images[emotion - 1].imagePath!);
      default:
        return Image.asset(
            Get.find<ModifyController>().images[emotion - 1].imagePath!);
    }
  }

  _box(ThemeMode currentMode) {
    return BoxDecoration(
        color: Mode.boxMode(currentMode),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            blurRadius: 0.2,
            color: Mode.shadowMode(currentMode),
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ModifyController());
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MyApp.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 10,
                      child: controller.isChatbotClicked.value == false
                          ? Emotion(controller.emotionIndex.value)
                          : controller.isChatbotLoading.value == false
                              ? Center(
                                  child: Image.asset(
                                      "assets/images/consulting.png"),
                                )
                              : Emotion(controller.emotionIndex.value)),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: _box(currentMode),
                    child: controller.isChatbotClicked.value == false
                        ? Text(
                            controller.chatbotMessage.value,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Jua_Regular',
                                height: 1,
                                color: Mode.textMode(currentMode)),
                          )
                        : controller.isChatbotLoading.value == false
                            ? SizedBox(
                                // width: MediaQuery.of(context).size.width / 8,
                                height: MediaQuery.of(context).size.height / 16,
                                child: const LoadingIndicator(
                                    indicatorType: Indicator.ballBeat,
                                    colors: [
                                      Colors.pink,
                                      Colors.yellow,
                                      Colors.blue
                                    ],
                                    strokeWidth: 1,
                                    backgroundColor: Colors.transparent,
                                    pathBackgroundColor: Colors.yellow),
                              )
                            : SingleChildScrollView(
                                child: Text(
                                  controller.chatbotMessage.value,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Jua_Regular',
                                      height: 1,
                                      color: Mode.textMode(currentMode)),
                                ),
                              ),
                  )
                ],
              ));
        });
  }
}
