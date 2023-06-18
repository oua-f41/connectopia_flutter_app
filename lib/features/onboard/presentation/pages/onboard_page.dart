import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../app/app_router.dart';
import '../view_model/onboard_model.dart';
import '../view_model/onboard_view_model.dart';

@RoutePage()
class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends OnboardViewModel {
  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: currentPage == index
            ? context.colorScheme.primary
            : context.colorScheme.primary.withOpacity(0.3),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast,
                ),
                controller: controller,
                onPageChanged: (value) => setState(() => currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: context.paddingLow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: context.verticalPaddingNormal,
                          child: Image.asset(
                            contents[i].image,
                            height: context.dynamicHeight(0.35),
                          ),
                        ),
                        Container(
                          padding: context.verticalPaddingNormal,
                          child: Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  (context.dynamicWidth(1) <= 550) ? 30 : 35,
                            ),
                          ),
                        ),
                        Container(
                          padding: context.horizontalPaddingMedium,
                          child: Text(
                            contents[i].desc,
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w300,
                              fontSize:
                                  (context.dynamicWidth(1) <= 550) ? 17 : 25,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (int index) => _buildDots(
                        index: index,
                      ),
                    ),
                  ),
                  currentPage + 1 == contents.length
                      ? Padding(
                          padding: const EdgeInsets.all(30),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 15),
                            ),
                            onPressed: () {
                              context.router.replace(const MainLoginRoute());
                            },
                            child: Text("START",
                                style: context.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.colorScheme.primary,
                                )),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  controller.animateToPage(contents.length - 1,
                                      duration: context.durationLow,
                                      curve: Curves.easeInOutSine);
                                },
                                child: const Text(
                                  "SKIP",
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  controller.nextPage(
                                    duration: context.durationLow,
                                    curve: Curves.easeInOutExpo,
                                  );
                                },
                                child: const Text(
                                  "NEXT",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
