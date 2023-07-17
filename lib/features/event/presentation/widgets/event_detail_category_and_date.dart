import 'package:connectopia/features/event/presentation/cubit/event_detail_cubit.dart';
import 'package:connectopia/features/event/presentation/cubit/view_model/event_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/models/core_models/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventDetailCategoryAndDate extends StatelessWidget {
  const EventDetailCategoryAndDate({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailCubit, EventDetailViewModel>(
      builder: (context, state) {
        return Container(
          padding: context.verticalPaddingLow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                state.event?.group?.category?.name ??
                    event.group?.category?.name ??
                    "",
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.outline,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat("dd/MM/yyyy - hh.mm").format(
                        state.event?.eventDate ??
                            event.eventDate ??
                            DateTime.now()),
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.outline,
                    ),
                  ),
                  state.isLoading
                      ? const SizedBox()
                      : Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 3.0),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                color: DateTime.now()
                                        .difference(state.event?.eventDate ??
                                            DateTime.now())
                                        .isNegative
                                    ? Colors.green
                                    : Colors.red,
                              ),
                              width: 15,
                              height: 15,
                            ),
                            Text(
                              DateTime.now()
                                      .difference(state.event?.eventDate ??
                                          DateTime.now())
                                      .isNegative
                                  ? AppLocalizations.of(context)!.upcomming
                                  : AppLocalizations.of(context)!.passed,
                              style: context.textTheme.titleSmall?.copyWith(
                                color: context.colorScheme.outline,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
