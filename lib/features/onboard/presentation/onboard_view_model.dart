import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../app/app_router.dart';
import 'models/onboard_model.dart';
import 'onboard_page.dart';

abstract class OnboardPageModel extends State<OnboardPage> {
  int currentIndex = 0;
  int lastItem = OnboardItems.datas.length - 1;

  bool get isLastItem => currentIndex == lastItem;
  bool get isFirstItem => currentIndex == 0;

  ValueNotifier<bool> isBackEnable = ValueNotifier(true);

  final PageController onBoardPageController = PageController();

  void incrementSelectedPage() {
    if (isLastItem) {
      goToLogin();
      return;
    }
    setSelectedPage(currentIndex + 1);
  }

  void reductiomSelectedPage() {
    if (isFirstItem) {
      return;
    }
    print("object");
    setSelectedPage(currentIndex - 1);
  }

  void setSelectedPage(int value) {
    if (value == lastItem) {
      isBackEnable.value = false;
    } else {
      isBackEnable.value = true;
    }
    setState(() {
      currentIndex = value;
    });
    onBoardPageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  void changeIsBackEnable(bool value) {
    if (value == isBackEnable.value) {
      return;
    }
    isBackEnable.value = value;
  }

  void goToLogin() {
    context.router.replace(const MainLoginRoute());
  }
}
