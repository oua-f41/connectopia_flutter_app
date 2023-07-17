import 'package:connectopia/features/groups/presentation/cubit/group_detail_cubit.dart';
import 'package:connectopia/features/groups/presentation/cubit/view_model/group_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/widgets/title_text.dart';
import '../../../event/presentation/widgets/event_card.dart';
import '../../../event/presentation/widgets/event_card_loading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroupDetailEventList extends StatelessWidget {
  const GroupDetailEventList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailCubit, GroupDetailViewModel>(
      builder: (context, state) {
        return Container(
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    padding: context.paddingNormal,
                    alignment: Alignment.bottomLeft,
                    child: TitleText(
                        text: "${AppLocalizations.of(context)!.events} ;")),
                state.isLoading
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) =>
                              const EventCardLoading(),
                        ),
                      )
                    : Expanded(
                        child: state.groupResponse?.events.isNotNullOrEmpty ==
                                true
                            ? ListView.separated(
                                separatorBuilder: (context, index) {
                                  return const Divider();
                                },
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    state.groupResponse?.events?.length ?? 0,
                                itemBuilder: (context, index) => EventCard(
                                    event: state.groupResponse?.events?[index]))
                            : Center(
                                child: Text(
                                AppLocalizations.of(context)!.noEvent,
                                style: context.textTheme.bodyLarge,
                              )),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
