import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../cubit/donate_cubit.dart';
import '../cubit/view_model/donate_view_model.dart';

class DonateHead extends StatelessWidget {
  const DonateHead({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonateCubit, DonateViewModel>(
      builder: (context, state) {
        return Container(
          padding: context.paddingMedium,
          child: Text(
            state.selectedAmount != null ? "${state.selectedAmount.toString()}₺": "__ ₺",
            style: context.textTheme.displayMedium,
          ));
      },
    );
  }
}