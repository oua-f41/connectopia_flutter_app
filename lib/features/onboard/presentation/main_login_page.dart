import 'package:auto_route/auto_route.dart';
import 'package:f41/product/constants/lottie_constants.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

import '../../../product/constants/image_constants.dart';

@RoutePage()
class MainLoginPage extends StatelessWidget {
  const MainLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 50),
              child:
                  Lottie.asset(LottieConstants.mainLoginAnimation.lottiePath)),
          Container(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: context.verticalPaddingLow,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(0)),
                    ),
                    onPressed: () {
                      print("object");
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromARGB(26, 56, 56, 56)),
                      ),
                      width: context.dynamicWidth(0.8),
                      height: context.dynamicHeight(0.06),
                      child: Container(
                        padding: context.horizontalPaddingNormal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30,
                              child: Image.asset(ImageConstants.mail.imagePath),
                            ),
                            Container(
                              padding: context.horizontalPaddingMedium,
                              child: Text("Sign In with Email",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: context.verticalPaddingLow,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(0)),
                    ),
                    onPressed: () {
                      print("object");
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromARGB(26, 56, 56, 56)),
                      ),
                      width: context.dynamicWidth(0.8),
                      height: context.dynamicHeight(0.06),
                      child: Container(
                        padding: context.horizontalPaddingNormal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 26,
                              child:
                                  Image.asset(ImageConstants.phone.imagePath),
                            ),
                            Container(
                              padding: context.horizontalPaddingMedium,
                              child: Text("Sign In with Phone",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: context.verticalPaddingLow,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(0)),
                    ),
                    onPressed: () {
                      print("object");
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromARGB(26, 56, 56, 56)),
                      ),
                      width: context.dynamicWidth(0.8),
                      height: context.dynamicHeight(0.06),
                      child: Container(
                        padding: context.horizontalPaddingNormal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 26,
                              child:
                                  Image.asset(ImageConstants.google.imagePath),
                            ),
                            Container(
                              padding: context.horizontalPaddingMedium,
                              child: Text("Sign In with Google",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
