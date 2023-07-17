import 'package:connectopia/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:connectopia/features/chat/presentation/cubit/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../product/constants/image_constants.dart';
import '../../../profile/domain/models/response/profile_response.dart';

class ChatHead extends StatelessWidget {
  const ChatHead({super.key, this.profileResponse});

  final ProfileResponse? profileResponse;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatViewModel>(
      builder: (context, state) {
        return SizedBox(
          width: context.dynamicWidth(0.6),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            subtitle: Text(
                state.otherUser?.userName ?? profileResponse?.userName ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1),
            leading: SizedBox(
              width: context.dynamicWidth(0.1),
              height: context.dynamicWidth(0.1),
              child: state.otherUser?.profilePhotoUrl != null ||
                      profileResponse?.profilePhotoUrl != null
                  ? ClipOval(
                      child: Image.network(
                          state.otherUser?.profilePhotoUrl ??
                              profileResponse?.profilePhotoUrl ??
                              "",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          ImageConstants.defaultProfilePhoto.imagePath,
                        );
                      }, loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const SkeletonAvatar();
                      }),
                    )
                  : ClipOval(
                      child: Image.asset(
                        ImageConstants.defaultProfilePhoto.imagePath,
                      ),
                    ),
            ),
            title: Text(
                state.otherUser?.fullName ?? profileResponse?.fullName ?? ""),
          ),
        );
      },
    );
  }
}
