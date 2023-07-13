import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/widgets/dropdown_form_field.dart';
import '../../../../product/widgets/title_text.dart';
import '../../../category/presentation/cubit/category_cubit.dart';
import '../../../category/presentation/cubit/view_model/category_view_model.dart';
import '../cubit/add_group_cubit.dart';
import '../cubit/view_model/add_group_view_model.dart';

class AddGroupForm extends StatelessWidget {
  const AddGroupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddGroupCubit, AddGroupViewModel>(
      builder: (context, state) {
        return Form(
          key: state.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  padding: context.verticalPaddingLow,
                  alignment: Alignment.centerLeft,
                  child: const TitleText(text: "Add Group ;")),
              _AddGroupNameInput(state),
              _AddGroupDescriptionInput(state),
              _AddGroupCategoryInput(state),
            ],
          ),
        );
      },
    );
  }
}

class _AddGroupCategoryInput extends StatelessWidget {
  const _AddGroupCategoryInput(this.state);

  final AddGroupViewModel state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.verticalPaddingLow,
      child: DropdownFormField(
          onTap: () async {
            final category = await showModalBottomSheet(
              context: context,
              builder: (context) {
                return BlocBuilder<CategoryCubit, CategoryViewModel>(
                  builder: (context, state) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(children: [
                          Positioned(
                              right: 0,
                              child: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  context.pop();
                                },
                                alignment: Alignment.topCenter,
                              )),
                          Container(
                            margin: context.onlyBottomPaddingNormal,
                            child: Divider(
                              color: Colors.black45,
                              thickness: 3,
                              indent: context.dynamicWidth(0.4),
                              endIndent: context.dynamicWidth(0.4),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: context.dynamicHeight(0.5),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.categories?.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title:
                                    Text(state.categories?[index]?.name ?? ""),
                                onTap: () {
                                  context.pop(state.categories?[index]);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            );
            if (category != null) {
              context.read<AddGroupCubit>().setGroupCategoryId(category);
            }
          },
          label: state.selectedCategory?.name ?? "Select Category"),
    );
  }
}

class _AddGroupDescriptionInput extends StatelessWidget {
  const _AddGroupDescriptionInput(this.state);

  final AddGroupViewModel state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        minLines: 2,
        maxLines: 8,
        maxLength: 1000,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter group description';
          }
          return null;
        },
        onChanged: (value) {
          context.read<AddGroupCubit>().setGroupDescription(value);
        },
        decoration: InputDecoration(
            counterText:
                state.groupRequest.description.isNotNullOrNoEmpty == true
                    ? "${state.groupRequest.description?.length}/${1000}"
                    : "",
            label: const Text("Group Description"),
            alignLabelWithHint: true),
      ),
    );
  }
}

class _AddGroupNameInput extends StatelessWidget {
  const _AddGroupNameInput(this.state);

  final AddGroupViewModel state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter group name';
          }
          return null;
        },
        onChanged: (value) {
          context.read<AddGroupCubit>().setGroupName(value);
        },
        decoration: const InputDecoration(
          label: Text("Group Name"),
        ),
      ),
    );
  }
}
