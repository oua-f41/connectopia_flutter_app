import 'package:flutter/material.dart';

import '../../../../product/models/core_models/event.dart';
import '../../../event/presentation/widgets/event_card.dart';
import '../../../event/presentation/widgets/event_card_loading.dart';

class HomeEventList extends StatelessWidget {
  const HomeEventList(
      {super.key, required this.events, required this.loadinger});

  final List<Event>? events;
  final bool loadinger;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: loadinger ? 2 : events?.length ?? 0,
      itemBuilder: (context, index) {
        return loadinger
            ? const EventCardLoading()
            : EventCard(
                event: events![index],
              );
      },
    );
  }
}
