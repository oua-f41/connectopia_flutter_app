import 'package:flutter/material.dart';

import '../models/onboard_model.dart';

class OnboardTabIndicator extends StatefulWidget {
  const OnboardTabIndicator({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<OnboardTabIndicator> createState() => OnboardTabIndicatorState();
}

class OnboardTabIndicatorState extends State<OnboardTabIndicator>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: OnboardItems.datas.length, vsync: this);
  }

  @override
  void didUpdateWidget(covariant OnboardTabIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      _tabController.animateTo(widget.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _tabController.length,
        (index) => buildDot(index: index),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _tabController.index == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _tabController.index == index
            ? Theme.of(context).colorScheme.primary
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
