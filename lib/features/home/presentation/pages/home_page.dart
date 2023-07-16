import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/home/presentation/cubit/home_cubit.dart';
import 'package:connectopia/features/home/presentation/cubit/view_model/home_view_model.dart';
import 'package:connectopia/features/home/presentation/widgets/home_event_list.dart';
import 'package:connectopia/features/home/presentation/widgets/home_head.dart';
import 'package:connectopia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:connectopia/product/constants/image_constants.dart';
import 'package:connectopia/features/profile/presentation/widgets/profile_photo_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../app/app_router.dart';
import '../../../../product/di/injection.dart';
import '../widgets/home_attended_groups.dart';

@RoutePage()
class HomePage extends StatelessWidget with AutoRouteWrapper {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: _HomeAppBar()),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<HomeCubit>().refresh();
          await context.read<ProfileCubit>().refresh();
        },
        child: SingleChildScrollView(
          child: Container(
              child: Container(
                  padding: context.paddingLow,
                  child: BlocBuilder<HomeCubit, HomeViewModel>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          const HomeHead(),
                          const HomeAttendedGroups(),
                          HomeEventList(
                              events: state.events,
                              loadinger: state.eventsLoading),
                          HomeEventList(
                              events: state.eventsOnCity,
                              loadinger: state.eventsOnCityLoading),
                          HomeEventList(
                              events: state.otherEvents,
                              loadinger: state.otherEventsLoading),
                        ],
                      );
                    },
                  ))),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "",
          onPressed: () async {
            final isSuccess = await context.router.push(const AddGroupRoute());
          },
          child: const Icon(Icons.group_add)),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..init(),
      child: this,
    );
  }
}

class _HomeAppBar extends PreferredSize {
  _HomeAppBar()
      : super(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              forceMaterialTransparency: true,
              title: Image.asset(ImageConstants.expandedLogo.imagePath,
                  height: 85),
              actions: [
                IconButton(
                  onPressed: () {
                    getIt.get<AppRouter>().push(const SearchRoute());
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    getIt.get<AppRouter>().push(const NotificationRoute());
                  },
                  icon: const Icon(Icons.notifications),
                ),
                Container(child: const ProfilePhotoButton())
              ],
            ));
}
