import 'package:flutter/material.dart';

import '../pages/onboard_page.dart';

abstract class OnboardViewModel extends State<OnboardPage> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  int currentPage = 0;
}
