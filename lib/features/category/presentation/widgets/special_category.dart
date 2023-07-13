import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../app/app_router.dart';
import '../../../../product/widgets/title_text.dart';
import '../cubit/view_model/category_view_model.dart';
import 'category_card.dart';

class PageHead extends StatelessWidget {
  const PageHead({super.key});

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

class SpecialCategory extends StatelessWidget {
  const SpecialCategory(this.state, {super.key});

  final CategoryViewModel state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.onlyBottomPaddingNormal,
      height: context.dynamicHeight(0.2),
      child: CategoryCard(
        category: state.categoriesWithDetails?[state.categories!
            .indexWhere((element) => element?.name == "NATURE & ENVIRONMENT")],
      ),
    );
  }
}
