import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:skeletons/skeletons.dart';

class ChatLoader extends StatelessWidget {
  const ChatLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) => Align(
          alignment:
              index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
          child: SizedBox(
            width: context.dynamicWidth(0.45),
            height: context.dynamicHeight(0.09),
            child: Container(
              margin: context.verticalPaddingLow,
              child: const SkeletonAvatar(),
            ),
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}
