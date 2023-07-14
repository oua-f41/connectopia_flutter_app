import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/constants/image_constants.dart';
import '../../../profile/domain/models/response/profile_response.dart';

class ChatHead extends StatelessWidget {
  const ChatHead({super.key, this.profileResponse});

  final ProfileResponse? profileResponse;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.6),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        subtitle: Text(profileResponse?.userName ?? "",
            overflow: TextOverflow.ellipsis, maxLines: 1),
        leading: profileResponse?.profilePhotoUrl != null
            ? CircleAvatar(
                backgroundImage:
                    NetworkImage(profileResponse!.profilePhotoUrl!),
              )
            : CircleAvatar(
                child: Image.asset(
                  ImageConstants.defaultProfilePhoto.imagePath,
                ),
              ),
        title: Text(profileResponse?.fullName ?? ""),
      ),
    );
  }
}
