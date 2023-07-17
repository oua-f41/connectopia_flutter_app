import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/globals.dart';
import '../../widgets/profile_attended_events.dart';
import '../../widgets/profile_attended_groups.dart';
import '../../widgets/profile_liked_events.dart';
import '../../widgets/profile_own_groups.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileTabs {
  final List<Tab> tabs;
  final List<Widget> widgets;

  ProfileTabs({required this.tabs, required this.widgets});

  static ProfileTabs getTabs() {
    return ProfileTabs(tabs: [
      Tab(
        child: AutoSizeText(
          AppLocalizations.of(snackbarKey.currentContext!)!.firstProfileTab,
          style: const TextStyle(fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
      Tab(
        child: AutoSizeText(
          AppLocalizations.of(snackbarKey.currentContext!)!.secondProfileTab,
          style: const TextStyle(fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
      Tab(
        child: AutoSizeText(
          AppLocalizations.of(snackbarKey.currentContext!)!.thirdProfileTab,
          style: const TextStyle(fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
      Tab(
        child: AutoSizeText(
          AppLocalizations.of(snackbarKey.currentContext!)!.fourthProfileTab,
          style: const TextStyle(fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
    ], widgets: [
      const ProfileOwnGroups(),
      const ProfileAttendedGroups(),
      const ProfileAttendedEvents(),
      const ProfileLikedEvents()
    ]);
  }
}
