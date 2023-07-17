import 'package:connectopia/features/groups/presentation/cubit/group_detail_cubit.dart';
import 'package:connectopia/features/groups/presentation/cubit/view_model/group_detail_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroupDetailAttending extends StatelessWidget {
  const GroupDetailAttending({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailCubit, GroupDetailViewModel>(
      builder: (context, state) {
        return state.groupResponse?.userId ==
                    FirebaseAuth.instance.currentUser?.uid ||
                state.groupResponse == null
            ? const SizedBox()
            : Container(
                padding: context.paddingLow,
                width: context.dynamicWidth(0.6),
                child: ElevatedButton(
                    onPressed: state.attendingLoading
                        ? null
                        : () {
                            if (state.isAttended != true) {
                              context.read<GroupDetailCubit>().attendGroup();
                            } else {
                              context.read<GroupDetailCubit>().leftGroup();
                            }
                          },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.isAttended != true
                            ? "Join"
                            : AppLocalizations.of(context)!.leave),
                        state.attendingLoading
                            ? Container(
                                padding: context.paddingLow,
                                width: 30,
                                height: 30,
                                child: const CircularProgressIndicator())
                            : const SizedBox()
                      ],
                    )),
              );
      },
    );
  }
}
