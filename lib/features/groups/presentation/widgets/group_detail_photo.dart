import 'package:connectopia/features/groups/presentation/cubit/group_detail_cubit.dart';
import 'package:connectopia/features/groups/presentation/cubit/view_model/group_detail_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../product/constants/image_constants.dart';
import '../../../../product/models/core_models/group.dart';

class GroupDetailPhoto extends StatelessWidget {
  const GroupDetailPhoto({super.key, this.group});

  final Group? group;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailCubit, GroupDetailViewModel>(
      builder: (context, state) {
        return SizedBox(
          height: context.dynamicHeight(0.3),
          child: Stack(
            children: [
              SizedBox(
                height: context.dynamicHeight(0.2),
                width: context.dynamicWidth(1),
                child: Hero(
                  tag: "${group?.category?.photoUrl}${group?.id}",
                  child: group?.category?.photoUrl?.isNotNullOrNoEmpty ==
                              true ||
                          state.groupResponse?.category?.photoUrl
                                  ?.isNotNullOrNoEmpty ==
                              true
                      ? Image.network(
                          state.groupResponse?.category?.photoUrl ??
                              group?.category?.photoUrl ??
                              "",
                          fit: BoxFit.cover,
                          color: Colors.black.withOpacity(0.5),
                          colorBlendMode: BlendMode.darken,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: SkeletonAvatar(),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(child: Icon(Icons.category));
                          },
                        )
                      : const Center(child: Icon(Icons.category)),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: state.groupResponse?.userId ==
                          FirebaseAuth.instance.currentUser?.uid
                      ? () {
                          context.read<GroupDetailCubit>().setGroupIcon();
                        }
                      : null,
                  child: SizedBox(
                    width: 140,
                    height: 140,
                    child: Hero(
                      tag: "${group?.iconUrl}${group?.id}",
                      child: ClipOval(
                        child: group?.iconUrl?.isNotEmpty == true
                            ? Image.network(
                                state.groupResponse?.iconUrl ?? group!.iconUrl!,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                    child: SkeletonAvatar(),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    ImageConstants.defaultGroupPhoto.imagePath,
                                    fit: BoxFit.cover,
                                  );
                                },
                              )
                            : Image.asset(
                                ImageConstants.defaultGroupPhoto.imagePath,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
