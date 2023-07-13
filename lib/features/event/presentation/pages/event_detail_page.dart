import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/event/presentation/cubit/view_model/event_detail_view_model.dart';
import 'package:connectopia/features/event/presentation/widgets/event_detail_attendees_button.dart';
import 'package:connectopia/features/event/presentation/widgets/event_detail_bottom_actions.dart';
import 'package:connectopia/features/event/presentation/widgets/event_detail_grop_and_like.dart';
import 'package:connectopia/features/event/presentation/widgets/event_detail_image.dart';
import 'package:connectopia/features/event/presentation/widgets/event_detail_category_and_date.dart';
import 'package:connectopia/features/event/presentation/widgets/event_detail_interested_groups.dart';
import 'package:connectopia/features/event/presentation/widgets/event_detail_location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/constants/edgeInsents_constants.dart';
import '../../../../product/models/core_models/event.dart';
import '../../../../product/widgets/title_text.dart';
import '../cubit/event_detail_cubit.dart';
import '../widgets/event_detail_edit_button.dart';

@RoutePage()
class EventDetailPage extends StatelessWidget with AutoRouteWrapper {
  const EventDetailPage({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailCubit, EventDetailViewModel>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                toolbarHeight: 40,
                expandedHeight: context.dynamicHeight(0.5),
                backgroundColor: context.colorScheme.background,
                elevation: 5,
                pinned: true,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: EventDetailImage(event: event),
                  stretchModes: const [
                    StretchMode.blurBackground,
                    StretchMode.zoomBackground,
                  ],
                ),
                leading: const _AutoBackButton(),
                actions: [
                  state.event?.group?.userId ==
                          FirebaseAuth.instance.currentUser?.uid
                      ? const EventDetailEditButton()
                      : const SizedBox(),
                ],
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(0.0),
                  child: _EventDetailScrollControl(),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  color: context.colorScheme.background,
                  padding: EdgeInsetsConstants.eventDetailGeneralPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(text: state.event?.name ?? event.name ?? "",),
                      EventDetailCategoryAndDate(event: event),
                      EventDetailGroupAndLike(event: event),
                      Text(state.event?.description ?? event.description ?? "",
                          style: Theme.of(context).textTheme.titleSmall),
                      EventDetailAttendeesButton(event: event),
                      Container(
                          padding: context.verticalPaddingLow,
                          child: const Divider()),
                      const EventDetailLocation(),
                      const EventDetailInterestedGroups()
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: state.isLoading
              ? const SizedBox()
              : EventDetailBottomActions(event: event)
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => EventDetailCubit()..init(event.id ?? ""),
      child: this,
    );
  }
}

class _AutoBackButton extends StatelessWidget {
  const _AutoBackButton();

  @override
  Widget build(BuildContext context) {
    return Center(child: AutoLeadingButton(builder: (context, leadingType, action) {
      return IconButton(
        style: IconButton.styleFrom(
            backgroundColor:
                context.colorScheme.outline.withOpacity(0.25),
          ),
        onPressed: () {
          if(leadingType == LeadingType.back){
            context.router.pop();
          }
        },
        icon: const Icon(Icons.arrow_back),
      );
    },));
  }
}

class _EventDetailScrollControl extends StatelessWidget {
  const _EventDetailScrollControl();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      child: Container(
        width: 40.0,
        height: 5.0,
        decoration: BoxDecoration(
          color: context.colorScheme.outline,
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
    );
  }
}
