import 'package:connectopia/features/groups/presentation/cubit/group_detail_cubit.dart';
import 'package:connectopia/features/groups/presentation/cubit/view_model/group_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/models/core_models/group.dart';

class GroupDetailDescription extends StatelessWidget {
  const GroupDetailDescription({
    super.key,
    required this.group,
  });

  final Group? group;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailCubit, GroupDetailViewModel>(
      builder: (context, state) {
        return Container(
          padding: context.horizontalPaddingNormal,
          child: Text(
            state.groupResponse?.description ?? group?.description ?? "",
            textAlign: TextAlign.center,
            maxLines: 3,
            style: context.textTheme.titleSmall!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        );
      },
    );
  }
}
