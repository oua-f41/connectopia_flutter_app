import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/profile/presentation/cubit/view_model/edit_profile_view_model.dart';
import 'package:connectopia/features/profile/presentation/widgets/edit_profile_form.dart';
import 'package:connectopia/product/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../domain/models/response/profile_response.dart';
import '../cubit/edit_profile_cubit.dart';

@RoutePage()
class EditProfilePage extends StatelessWidget with AutoRouteWrapper {
  const EditProfilePage({super.key, required this.profileResponse});

  final ProfileResponse profileResponse;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileViewModel>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            forceMaterialTransparency: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center, 
              child: const EditProfileForm()
            ),
          ),
          floatingActionButton: FloatingActionButton(
              heroTag: "",
              child: const Icon(Icons.done),
              onPressed: () async {
                bool isSuccess =
                    await context.read<EditProfileCubit>().updateUser();
                if (isSuccess) {
                  context.router.pop(true);
                }
              }),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit()..init(profileResponse),
      child: this,
    );
  }
}
