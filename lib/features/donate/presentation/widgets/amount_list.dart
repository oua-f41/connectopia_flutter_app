import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../cubit/donate_cubit.dart';
import '../cubit/view_model/donate_view_model.dart';

class AmountList extends StatelessWidget {
  const AmountList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonateCubit, DonateViewModel>(
      builder: (context, state) {
        return Container(
          padding: context.paddingNormal,
          height: context.dynamicWidth(0.5),
          child: GridView.builder(
              itemCount: state.amounts.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      mainAxisExtent: 50),
              itemBuilder: (context, index) {
                return ElevatedButton(
                  onPressed: state.selectedAmount == state.amounts[index] ? null : () {
                    context.read<DonateCubit>().selectAmount(state.amounts[index]);
                  },
                  child: Text("${state.amounts[index].toString()}₺"),
                );
              }),
        );
      },
    );
  }
}