import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../app/app_router.dart';
import '../../../../product/widgets/title_text.dart';

class CategoriesHead extends StatelessWidget {
  const CategoriesHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: context.paddingNormal,
            alignment: Alignment.topLeft,
            child: const TitleText(text: "Categories;")),
        TextButton(
            onPressed: () {
              context.router.push(GroupsRoute());
            },
            child: const Text("See All"))
      ],
    );
  }
}
