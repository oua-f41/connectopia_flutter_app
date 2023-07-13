
import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/donate/presentation/cubit/view_model/donate_view_model.dart';
import 'package:connectopia/features/donate/presentation/widgets/google_pay_donate_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../product/models/core_models/group.dart';
import '../cubit/donate_cubit.dart';
import '../widgets/amount_list.dart';
import '../widgets/donate_head.dart';

@RoutePage()
class DonatePage extends StatelessWidget with AutoRouteWrapper{
  DonatePage({super.key, required this.group});

  final Group group;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonateCubit, DonateViewModel>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(group.name.toString()),
          ),
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DonateHead(),
                AmountList()
              ],
            ),
          ),
          bottomNavigationBar: state.selectedAmount != null 
          ? const GooglePayDonateButton()
          : const SizedBox()
        );
      },
    );
  }
  
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => DonateCubit(),
      child: this,
    );
  }
}
