import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../app/app_router.dart';
import '../cubit/search_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.isButton = false,
  });

  final bool isButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      child: TextField(
        onChanged: (value) {
          context.read<SearchCubit>().changeSearchKey(value);
        },
        canRequestFocus: isButton ? false : true,
        autofocus: isButton ? false : true,
        onTap: isButton ? () => context.router.push(const SearchRoute()) : null,
        decoration: InputDecoration(
            hintStyle: const TextStyle(fontWeight: FontWeight.bold),
            hintText: AppLocalizations.of(context)!.search,
            prefixIcon: const Icon(Icons.search)),
      ),
    );
  }
}
