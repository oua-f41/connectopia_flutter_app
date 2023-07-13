import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/groups/presentation/cubit/group_detail_cubit.dart';
import 'package:connectopia/features/groups/presentation/cubit/view_model/group_detail_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../app/app_router.dart';
import '../../../../product/constants/image_constants.dart';
import '../../../../product/models/core_models/user.dart' as ProjectUser;

class GroupDetailOwnerButton extends StatelessWidget {
  const GroupDetailOwnerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailCubit, GroupDetailViewModel>(
      builder: (context, state) {
        return state.groupResponse?.userId == FirebaseAuth.instance.currentUser?.uid
        ? const SizedBox()
        : Container(
          padding: context.paddingLow,
          child: InkWell(
            onTap: () {
              context.router.push(
                  ProfileRoute(
                      user: state
                              .groupResponse
                              ?.owner ??
                          ProjectUser
                              .User()));
            },
            child:
                state.groupResponse !=
                        null
                    ? Row(
                        mainAxisSize:
                            MainAxisSize
                                .min,
                        children: [
                          Container(
                            padding: context
                                .paddingLow,
                            child: const Text(
                                "Creaed By:"),
                          ),
                          Text(
                            state
                                    .groupResponse
                                    ?.owner
                                    ?.fullName ??
                                "",
                            style: context
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: context
                                        .colorScheme
                                        .primary,
                                    fontWeight:
                                        FontWeight.w500),
                          ),
                          Container(
                            padding: context
                                .horizontalPaddingLow,
                            child:
                                ClipOval(
                              child: Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.white,
                                  child: state.groupResponse?.owner?.profilePhotoUrl?.isNotNullOrNoEmpty == true
                                      ? Image.network(
                                          state.groupResponse!.owner!.profilePhotoUrl!,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          ImageConstants.defaultProfilePhoto.imagePath,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        )),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
          ),
        );
      },
    );
  }
}
