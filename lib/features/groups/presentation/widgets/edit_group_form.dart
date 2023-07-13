import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/widgets/dropdown_form_field.dart';
import '../../../../product/widgets/title_text.dart';
import '../../../category/domain/models/response/category_response.dart';
import '../../../category/presentation/cubit/category_cubit.dart';
import '../../../category/presentation/cubit/view_model/category_view_model.dart';
import '../cubit/edit_group_cubit.dart';
import '../cubit/view_model/edit_group_view_model.dart';

class EditGroupForm extends StatelessWidget {
  const EditGroupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditGroupCubit, EditGroupViewModel>(
      bloc: context.read<EditGroupCubit>(),
      builder: (context, state) {
        return Form(
          key: state.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  padding: context.verticalPaddingLow,
                  alignment: Alignment.centerLeft,
                  child: const TitleText(text: "Edit Group ;")),
              _EditGroupNameInput(state),
              _EditGroupDescriptionInput(state),
              _EditGroupCategoryInput(state),
            ],
          ),
        );
      },
    );
  }
}

class _EditGroupCategoryInput extends StatelessWidget {
  const _EditGroupCategoryInput(this.state);

  final EditGroupViewModel state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.verticalPaddingLow,
      child: DropdownFormField(
          onTap: () async {
            final response = await showModalBottomSheet<CategoryResponse>(
              context: context,
              builder: (context) {
                return BlocBuilder<CategoryCubit, CategoryViewModel>(
                  builder: (context, state) {
                    return Column(
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
                                  // ignore: deprecated_member_use
                                  context.pop(state.categories![index]);
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
            if (response != null) {
              context.read<EditGroupCubit>().setGroupCategoryId(response);
            }
          },
          label: state.selectedCategory?.name ?? "Select Category"),
    );
  }
}

class _EditGroupDescriptionInput extends StatelessWidget {
  const _EditGroupDescriptionInput(this.state);

  final EditGroupViewModel state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        initialValue: state.updateGroupRequest?.description,
        minLines: 2,
        maxLines: 8,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter group description';
          }
          return null;
        },
        onChanged: (value) {
          context.read<EditGroupCubit>().setGroupDescription(value);
        },
        decoration: const InputDecoration(
            label: Text("Group Description"), alignLabelWithHint: true),
      ),
    );
  }
}

class _EditGroupNameInput extends StatelessWidget {
  const _EditGroupNameInput(this.state);

  final EditGroupViewModel state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        initialValue: state.updateGroupRequest?.name,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter group name';
          }
          return null;
        },
        onChanged: (value) {
          context.read<EditGroupCubit>().setGroupName(value);
        },
        decoration: const InputDecoration(
          label: Text("Group Name"),
        ),
      ),
    );
  }
}
