import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/groups/presentation/cubit/edit_group_cubit.dart';
import 'package:connectopia/features/groups/presentation/widgets/edit_group_form.dart';
import 'package:connectopia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/constants/image_constants.dart';
import '../../../../product/models/core_models/category.dart';
import '../../../maps/presentation/cubit/maps_cubit.dart';
import '../../domain/models/response/group_response.dart';
import '../cubit/view_model/edit_group_view_model.dart';

@RoutePage()
class EditGroupPage extends StatelessWidget with AutoRouteWrapper {
  const EditGroupPage(
      {super.key, required this.updateGroupRequest, required this.category});

  final GroupResponse updateGroupRequest;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                final isDeleteing = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: ShapeBorder.lerp(
                          RoundedRectangleBorder(
                              borderRadius: context.normalBorderRadius),
                          RoundedRectangleBorder(
                              borderRadius: context.normalBorderRadius),
                          1)!,
                      title: const Text("Delete Event"),
                      content: const Text(
                          "Are you sure you want to delete this event?"),
                      actions: [
                        OutlinedButton(
                            onPressed: () {
                              context.router.pop(false);
                            },
                            child: const Text("Back")),
                        TextButton(
                            onPressed: () {
                              context.router.pop(true);
                            },
                            child: Text(
                              "Delete",
                              style:
                                  TextStyle(color: context.colorScheme.error),
                            )),
                      ],
                    );
                  },
                );
                if (isDeleteing == true) {
                  bool response =
                      await context.read<EditGroupCubit>().deleteGroup();
                  if (response == true) {
                    context.router.pop(EditGroupActions.delete);
                    await context.read<MapsCubit>().refresh();
                    await context.read<ProfileCubit>().refresh();
                  }
                }
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              padding: context.horizontalPaddingNormal,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: context.paddingMedium,
                    child: AnimatedContainer(
                      duration: context.durationLow,
                      height: context.isKeyBoardOpen
                          ? 0
                          : context.dynamicHeight(0.2),
                      child: Image.asset(
                        ImageConstants.logo.imagePath,
                      ),
                    ),
                  ),
                  const EditGroupForm()
                ],
              )),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "",
          onPressed: () async {
            bool isSuccess = await context.read<EditGroupCubit>().updateGroup();
            if (isSuccess) {
              context.router.pop(EditGroupActions.update);
            }
          },
          child: const Icon(Icons.done),
        ));
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => EditGroupCubit()
        ..init(request: updateGroupRequest, category: category),
      child: this,
    );
  }
}
