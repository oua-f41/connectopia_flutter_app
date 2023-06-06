import 'package:flutter/material.dart';

import '../../../../product/constants/text_constants.dart';
import 'onboard_tab_indicator.dart';

class OnboardBottomBar extends StatefulWidget {
  const OnboardBottomBar({
    super.key,
    required this.onPressButton,
    required this.index,
    required this.isLastItem,
  });

  final int index;
  final VoidCallback onPressButton;
  final bool isLastItem;

  @override
  State<OnboardBottomBar> createState() => OnboardBottomBarState();
}

class OnboardBottomBarState extends State<OnboardBottomBar> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.index;
  }

  @override
  void didUpdateWidget(covariant OnboardBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.index != oldWidget.index) {
      _index = widget.index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OnboardTabIndicator(index: _index),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ElevatedButton(
              onPressed: () {
                widget.onPressButton();
              },
              /* shape: const CircleBorder(), */
              child: Text(
                widget.isLastItem
                    ? TextConstants.onboardStart
                    : TextConstants.onboardNext,
                style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
