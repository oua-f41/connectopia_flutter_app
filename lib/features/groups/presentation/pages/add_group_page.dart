import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/groups/presentation/cubit/add_group_cubit.dart';
import 'package:connectopia/features/groups/presentation/widgets/add_group_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/constants/image_constants.dart';

@RoutePage()
class AddGroupPage extends StatelessWidget with AutoRouteWrapper {
  const AddGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
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
                    height:
                        context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.2),
                    child: Image.asset(
                      ImageConstants.logo.imagePath,
                    ),
                  ),
                ),
                const AddGroupForm()
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "",
        onPressed: () async {
          bool isSuccess = await context.read<AddGroupCubit>().addGroup();
          if (isSuccess) {
            context.router.pop(true);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (context) => AddGroupCubit()..init(), child: this);
  }
}
