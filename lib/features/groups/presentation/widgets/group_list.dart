import 'package:connectopia/features/groups/presentation/cubit/view_model/groups_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../category/presentation/cubit/category_cubit.dart';
import '../../../category/presentation/cubit/view_model/category_view_model.dart';
import '../cubit/groups_cubit.dart';

class GroupList extends StatelessWidget {
  const GroupList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const _GroupListHead(),
          BlocBuilder<CategoryCubit, CategoryViewModel>(
            builder: (context, state) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.categoriesWithDetails?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    padding: context.paddingLow,
                    alignment: Alignment.centerLeft,
                    child: context.watch<GroupsCubit>().state.currentCategory ==
                            state.categoriesWithDetails?[index]
                        ? ElevatedButton(
                            onPressed: () {},
                            child: Text(
                                state.categoriesWithDetails?[index]?.name ??
                                    ""),
                          )
                        : OutlinedButton(
                            onPressed: () {
                              context.read<GroupsCubit>().changeCategory(
                                  state.categoriesWithDetails?[index]);
                            },
                            child: Text(
                                state.categoriesWithDetails?[index]?.name ??
                                    ""),
                          ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class _GroupListHead extends StatelessWidget {
  const _GroupListHead();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupsCubit, GroupsViewModel>(
      builder: (context, state) {
        return Container(
          padding: context.paddingLow,
          alignment: Alignment.centerLeft,
          child: state.currentCategory?.id == null
              ? ElevatedButton(
                  onPressed: () {},
                  child: const Text("All"),
                )
              : OutlinedButton(
                  onPressed: () {
                    context.read<GroupsCubit>().getAllGroups();
                  },
                  child: const Text("All"),
                ),
        );
      },
    );
  }
}
