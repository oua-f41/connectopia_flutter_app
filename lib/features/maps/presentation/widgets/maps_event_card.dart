import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/maps/presentation/cubit/maps_cubit.dart';
import 'package:connectopia/features/maps/presentation/cubit/view_model/maps_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

import '../../../../app/app_router.dart';
import '../../../../product/constants/image_constants.dart';
import '../../../../product/widgets/title_text.dart';

class MapsEventCard extends StatelessWidget {
  const MapsEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsViewModel>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (state.selectedEvent == null) return;
            context.router.push(EventDetailRoute(event: state.selectedEvent!));
          },
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
                height: context.dynamicHeight(0.25),
                width: context.dynamicWidth(0.9),
                child: Row(
                  children: [
                    SizedBox(
                        width: context.dynamicWidth(0.3),
                        child: state.selectedEvent?.eventPhotoUrl
                                    .isNotNullOrNoEmpty ==
                                true
                            ? Image.network(
                                state.selectedEvent?.eventPhotoUrl ?? "",
                                fit: BoxFit.cover,
                                height: context.dynamicHeight(0.25),
                              )
                            : const Center(
                                child: Icon(
                                  Icons.image,
                                  size: 50,
                                ),
                              )),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: context.dynamicWidth(0.5),
                          height: context.dynamicHeight(0.058),
                          alignment: Alignment.topLeft,
                          padding: context.paddingLow,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: TitleText(
                              text: state.selectedEvent?.name ?? "",
                            ),
                          ),
                        ),
                        Container(
                          padding: context.horizontalPaddingLow,
                          width: context.dynamicWidth(0.5),
                          alignment: Alignment.topLeft,
                          child: Text(
                            state.selectedEvent?.description ?? "",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: context.dynamicWidth(0.5),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Row(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Row(children: [
                                        Container(
                                          padding: context.paddingLow,
                                          child: ClipOval(
                                            child: state
                                                        .selectedEvent
                                                        ?.group
                                                        ?.iconUrl
                                                        .isNotNullOrNoEmpty ==
                                                    true
                                                ? Image.network(
                                                    state.selectedEvent?.group
                                                            ?.iconUrl ??
                                                        "",
                                                    fit: BoxFit.cover,
                                                    height: 20,
                                                    width: 20,
                                                  )
                                                : Image.asset(
                                                    ImageConstants
                                                        .defaultGroupPhoto
                                                        .imagePath,
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                          ),
                                        ),
                                        Text(
                                          state.selectedEvent?.group?.name ??
                                              "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                const Text(" • "),
                                Text(
                                  state.selectedEvent?.group?.category?.name ??
                                      "",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: context.horizontalPaddingLow,
                            width: context.dynamicWidth(0.6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(DateFormat("dd/MM/yyyy").format(
                                    state.selectedEvent?.eventDate ??
                                        DateTime.now())),
                                ElevatedButton(
                                    onPressed: () {
                                      if (state.selectedEvent == null) {
                                        return;
                                      }
                                      context.router.push(EventDetailRoute(
                                          event: state.selectedEvent!));
                                    },
                                    child: const Text("Go To Detail"))
                              ],
                            ),
                          ),
                        )
                      ],
                    ))
                  ],
                )),
          ),
        );
      },
    );
  }
}
