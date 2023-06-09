import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/main.dart';
import 'package:test_app/src/config/palette.dart';
import 'package:test_app/src/controller/auth/load_controller.dart';

class LoadComponent extends StatelessWidget {
  const LoadComponent({super.key});

  // Widget _explain() {
  //   return Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //       child: const Text(
  //         "저희 서비스는 일기를 토대로 감정을 상담해주면서 분석을 해주는 서비스입니다. 저희 서비스를 이용하기 위해서 고객님의 소중한 모바일 기기의 정보를 제공해주셔야 이용이 가능합니다. ",
  //         style: TextStyle(fontFamily: 'Jua_Regular', fontSize: 16),
  //         maxLines: 6,
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    Get.put(LoadController());
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MyApp.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return Obx(() => Scaffold(
                body: Form(
                  key: Get.find<LoadController>().loadFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding: const EdgeInsets.all(23),
                    child: Column(
                      children: [
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.height,
                                height: 240,
                                decoration: BoxDecoration(
                                    color: currentMode == ThemeMode.dark
                                        ? const Color(0xff292929)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: TextFormField(
                                              controller:
                                                  Get.find<LoadController>()
                                                      .nicknameController,
                                              validator: (text) {
                                                if (text == null ||
                                                    text.isEmpty) {
                                                  return "닉네임을 입력해주세요";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              style: const TextStyle(
                                                  fontFamily: 'Jua_Regular',
                                                  fontSize: 18),
                                              onChanged: (value) {
                                                Get.find<LoadController>()
                                                    .changeNickname(value);
                                              },
                                              decoration: const InputDecoration(
                                                  prefixIcon:
                                                      Icon(Icons.person),
                                                  labelText: "닉네임"),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: TextFormField(
                                              controller:
                                                  Get.find<LoadController>()
                                                      .passwordController,
                                              obscureText: true,
                                              style: const TextStyle(
                                                  fontFamily: 'Jua_Regular',
                                                  fontSize: 18),
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              validator: (text) {
                                                if (text == null ||
                                                    text.isEmpty) {
                                                  return "비밀번호를 입력해주세요";
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                Get.find<LoadController>()
                                                    .changePassword(value);
                                              },
                                              decoration: const InputDecoration(
                                                  prefixIcon: Icon(Icons.lock),
                                                  labelText: "비밀번호"),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 24,
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18, right: 50),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 0),
                                        child: Checkbox(
                                            value: Get.find<LoadController>()
                                                .ischecked
                                                .value,
                                            activeColor:
                                                const Color(0xff0f1648a),
                                            onChanged: (value) {
                                              Get.find<LoadController>()
                                                  .changeCheck(value);
                                            }),
                                      ),
                                      const Center(
                                        child: Text(
                                          "기기고유정보 사용에 동의합니다.",
                                          style: TextStyle(
                                              height: 2,
                                              fontFamily: 'Jua_Regular',
                                              fontSize: 16),
                                        ),
                                      ),

                                      // IconButton(
                                      //     onPressed: () {
                                      //       Get.find<LoadController>().test();
                                      //     },
                                      //     icon: Icon(
                                      //         Get.find<LoadController>().isAgree ==
                                      //                 false
                                      //             ? Icons.keyboard_arrow_down
                                      //             : Icons.keyboard_arrow_up))
                                    ],
                                  ),
                                ),
                              ),
                              // if (Get.find<LoadController>().isAgree ==
                              //     true) ...[
                              //   _explain(),
                              // ]
                            ],
                          ),
                        )),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                backgroundColor: const Color(0xffF1648A)),
                            child: const Text(
                              "불러오기",
                              style: TextStyle(
                                  fontFamily: 'Jua_Regular', fontSize: 24),
                            ),
                            onPressed: () {
                              Get.find<LoadController>().loadup();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
