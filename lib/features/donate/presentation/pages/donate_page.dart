import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/donate/presentation/cubit/view_model/donate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:pay/pay.dart';

import '../../../../product/models/core_models/group.dart';
import '../../pay_constants.dart';
import '../cubit/donate_cubit.dart';

@RoutePage()
class DonatePage extends StatelessWidget with AutoRouteWrapper{
  DonatePage({super.key, required this.group});

  final Group group;

  final _paymentItems = [
    const PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    ),
    const PaymentItem(
      label: 'Total',
      amount: '49.99',
      status: PaymentItemStatus.final_price,
    ),
  ];

  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server / PSP
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonateCubit, DonateViewModel>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(group.name.toString()),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: context.paddingMedium,
                      child: Text(
                        state.selectedAmount != null ? "${state.selectedAmount.toString()}₺": "__ ₺",
                        style: context.textTheme.displayMedium,
                      )),
                  Container(
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
                  ),
                ],
              ),
            ),
            bottomNavigationBar: state.selectedAmount != null ? Container(
                child: GooglePayButton(
                paymentConfiguration: PaymentConfiguration.fromJsonString(PayConstants.defaultGooglePay),
                paymentItems: [
                  PaymentItem(
                    label: 'Total',
                    amount: state.selectedAmount.toString(),
                    status: PaymentItemStatus.final_price,
                  ),
                ],
                type: GooglePayButtonType.pay,
                margin: context.paddingMedium,
                onPaymentResult: onGooglePayResult,
                
              ),
            ):const SizedBox());
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
