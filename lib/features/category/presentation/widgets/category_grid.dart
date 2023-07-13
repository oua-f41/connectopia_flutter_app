import 'package:flutter/material.dart';

import '../cubit/view_model/category_view_model.dart';
import 'category_card.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid(this.state, {super.key});

  final CategoryViewModel state;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 150,
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: state.categories?.length ?? 0,
        itemBuilder: (context, index) {
          return CategoryCard(
            category: state.categoriesWithDetails?[index],
          );
        });
  }
}
