
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:pay/pay.dart';

import '../../api/pay_constants.dart';
import '../cubit/donate_cubit.dart';
import '../cubit/view_model/donate_view_model.dart';

class GooglePayDonateButton extends StatelessWidget {
  const GooglePayDonateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonateCubit, DonateViewModel>(
      builder: (context, state) {
        return GooglePayButton(
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
          onPaymentResult: context.read<DonateCubit>().tryPay,
        );
      },
    );
  }
}