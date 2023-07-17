import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

import '../../../../app/app_router.dart';
import '../../../../core/helpers/globals.dart';
import '../../../../product/widgets/title_text.dart';
import '../../../location_picking/domain/models/event_location.dart';
import '../cubit/edit_event_cubit.dart';
import '../cubit/view_model/edit_event_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditEventForm extends StatelessWidget {
  const EditEventForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditEventCubit, EditEventViewModel>(
      builder: (context, state) {
        return Form(
          key: state.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const _ImagePicker(),
              Container(
                  padding: context.paddingNormal,
                  alignment: Alignment.centerLeft,
                  child: const TitleText(text: "Edit Event ;")),
              const _EventNameInput(),
              const _EventDescriptionInput(),
              const _EventDatePicker(),
              const _EventLocationPicker(),
            ],
          ),
        );
      },
    );
  }
}

class _EventLocationPicker extends StatelessWidget {
  const _EventLocationPicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditEventCubit, EditEventViewModel>(
      builder: (context, state) {
        return Container(
          padding: context.paddingLow,
          child: InkWell(
            borderRadius: context.normalBorderRadius,
            onTap: () async {
              final location = await context.router.push(LocationPickingRoute(
                  initialLat:
                      double.tryParse(state.eventRequest.eventLat ?? ""),
                  initialLng:
                      double.tryParse(state.eventRequest.eventLng ?? "")));
              if (location is EventLocation) {
                await context.read<EditEventCubit>().setEventLocation(location);
              }
            },
            child: TextFormField(
              validator: (value) {
                if (state.eventRequest.eventAddress == null) {
                  return AppLocalizations.of(snackbarKey.currentContext!)!
                      .addEventFormSelectLocation;
                }
                return null;
              },
              initialValue: state.eventRequest.eventAddress,
              enabled: false,
              maxLines: 4,
              minLines: 1,
              decoration: InputDecoration(
                hintText: state.eventRequest.eventAddress ?? 'Select Location',
                suffixIcon: state.eventRequest.eventAddress == null
                    ? const Icon(Icons.arrow_forward_ios_rounded)
                    : const Icon(Icons.edit_location_alt_rounded),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EventDatePicker extends StatelessWidget {
  const _EventDatePicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditEventCubit, EditEventViewModel>(
      builder: (context, state) {
        return Container(
          padding: context.paddingLow,
          child: InkWell(
            borderRadius: context.normalBorderRadius,
            onTap: () async {
              DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
              );
              TimeOfDay? time = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());
              if (date == null || time == null) return;
              DateTime dateTime = DateTime(
                  date.year, date.month, date.day, time.hour, time.minute);
              context.read<EditEventCubit>().setEventDate(dateTime);
            },
            child: TextFormField(
              validator: (value) {
                if (state.eventRequest.eventDate == null) {
                  return 'Please select event date';
                }
                return null;
              },
              initialValue: state.eventRequest.eventDate != null
                  ? DateFormat("dd/MM/yyyy  •  hh.mm")
                      .format(DateTime.parse(state.eventRequest.eventDate!))
                  : null,
              enabled: false,
              decoration: InputDecoration(
                hintText: state.eventRequest.eventDate != null
                    ? DateFormat("dd/MM/yyyy  •  hh.mm")
                        .format(DateTime.parse(state.eventRequest.eventDate!))
                    : 'Select Date',
                suffixIcon: state.eventRequest.eventDate == null
                    ? const Icon(Icons.calendar_month_outlined)
                    : const Icon(Icons.edit_calendar_outlined),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EventDescriptionInput extends StatelessWidget {
  const _EventDescriptionInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditEventCubit, EditEventViewModel>(
      builder: (context, state) {
        return Container(
          padding: context.paddingLow,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter event description';
              }
              return null;
            },
            initialValue: state.eventRequest.description,
            minLines: 2,
            maxLines: 6,
            decoration: const InputDecoration(
                label: Text('Event Description'), alignLabelWithHint: true),
            onChanged: (value) {
              context.read<EditEventCubit>().onDescriptionChanged(value);
            },
          ),
        );
      },
    );
  }
}

class _EventNameInput extends StatelessWidget {
  const _EventNameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditEventCubit, EditEventViewModel>(
      builder: (context, state) {
        return Container(
          padding: context.paddingLow,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter event name';
              }
              return null;
            },
            initialValue: state.eventRequest.name,
            decoration: const InputDecoration(
              label: Text('Event Name'),
            ),
            onChanged: (value) {
              context.read<EditEventCubit>().onNameChanged(value);
            },
          ),
        );
      },
    );
  }
}

class _ImagePicker extends StatelessWidget {
  const _ImagePicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditEventCubit, EditEventViewModel>(
      builder: (context, state) {
        return Padding(
          padding: context.paddingNormal,
          child: InkWell(
            onTap: () {
              context.read<EditEventCubit>().selectImage();
            },
            borderRadius: context.normalBorderRadius,
            child: Container(
                height: context.dynamicHeight(0.25),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: context.normalBorderRadius,
                ),
                child: state.image == null
                    ? state.eventRequest.eventPhotoUrl.isNotNullOrNoEmpty ==
                            true
                        ? Image.network(state.eventRequest.eventPhotoUrl ?? "")
                        : const Center(
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 50,
                            ),
                          )
                    : Image.file(
                        state.image!,
                        height: context.dynamicHeight(0.25),
                        fit: BoxFit.cover,
                      )),
          ),
        );
      },
    );
  }
}
