import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../app/app_router.dart';
import '../../../../product/widgets/title_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesHead extends StatelessWidget {
  const CategoriesHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: context.paddingNormal,
            alignment: Alignment.topLeft,
            child: TitleText(
                text: "${AppLocalizations.of(context)!.categories};")),
        TextButton(
            onPressed: () {
              context.router.push(GroupsRoute());
            },
            child: Text(AppLocalizations.of(context)!.seeAll))
      ],
    );
  }
}
