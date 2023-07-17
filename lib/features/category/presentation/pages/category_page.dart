import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/category/presentation/widgets/categories_head.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../search/presentation/widgets/custom_search_bar.dart';
import '../cubit/category_cubit.dart';
import '../cubit/view_model/category_view_model.dart';
import '../widgets/category_grid.dart';
import '../widgets/special_category.dart';

@RoutePage()
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(context.dynamicHeight(0.1)),
          child: AppBar(
            forceMaterialTransparency: true,
            titleSpacing: 1,
            toolbarHeight: context.dynamicHeight(0.1),
            title: const CustomSearchBar(isButton: true),
          )),
      body: BlocBuilder<CategoryCubit, CategoryViewModel>(
        builder: (context, state) {
          return state.categories != null
              ? SingleChildScrollView(
                  child: Container(
                    padding: context.horizontalPaddingLow,
                    child: Column(
                      children: [
                        const CategoriesHead(),
                        SpecialCategory(state),
                        CategoryGrid(state),
                      ],
                    ),
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
