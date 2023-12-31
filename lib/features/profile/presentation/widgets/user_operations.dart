import 'package:auto_route/auto_route.dart';
import 'package:connectopia/app/app_router.dart';
import 'package:connectopia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:connectopia/features/profile/presentation/cubit/view_model/profile_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserOperations extends StatelessWidget {
  const UserOperations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileViewModel>(
      builder: (context, state) {
        return state.profileResponse != null
            ? Container(
                height: context.dynamicHeight(0.11),
                padding: context.horizontalPaddingMedium,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(
                          padding: context.horizontalPaddingLow,
                          child: state.profileResponse?.id ==
                                  FirebaseAuth.instance.currentUser?.uid
                              ? ElevatedButton(
                                  onPressed: () async {
                                    if (state.defaultUser == null) return;
                                    final isSuccess = await context.router.push(
                                        EditProfileRoute(
                                            profileResponse:
                                                state.profileResponse!));
                                    if (isSuccess == true) {
                                      context.read<ProfileCubit>().refresh();
                                    }
                                  },
                                  child: Text(AppLocalizations.of(context)!
                                      .editProfile))
                              : state.profileResponse?.followers?.any(
                                        (element) =>
                                            element.followerId ==
                                            FirebaseAuth
                                                .instance.currentUser?.uid,
                                      ) !=
                                      true
                                  ? ElevatedButton(
                                      onPressed: state.followingLoading
                                          ? null
                                          : () {
                                              context
                                                  .read<ProfileCubit>()
                                                  .follow();
                                            },
                                      child: const Text("Takip Et"))
                                  : Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                              onPressed: state.followingLoading
                                                  ? null
                                                  : () {
                                                      context
                                                          .read<ProfileCubit>()
                                                          .unfollow();
                                                    },
                                              child:
                                                  const Text("Takibi Bırak")),
                                        ),
                                        Container(
                                          padding: context.horizontalPaddingLow,
                                          child: IconButton(
                                              onPressed: state.followingLoading
                                                  ? null
                                                  : () {
                                                      if (state
                                                              .profileResponse ==
                                                          null) return;
                                                      context.router.push(ChatRoute(
                                                          profileResponse: state
                                                              .profileResponse!));
                                                    },
                                              icon: const Icon(
                                                  Icons.message_outlined)),
                                        )
                                      ],
                                    )),
                    ),
                  ],
                ),
              )
            : const SizedBox();
      },
    );
  }
}
