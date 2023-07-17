import 'package:connectopia/core/helpers/globals.dart';
import 'package:connectopia/features/donate/presentation/cubit/view_model/donate_view_model.dart';
import 'package:connectopia/product/widgets/info_snack_bar.dart';

import '../../../../app/base_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DonateCubit extends BaseCubit<DonateViewModel> {
  DonateCubit() : super(DonateViewModel());

  void selectAmount(int amount) {
    emit(state.copyWith(selectedAmount: amount));
  }

  void tryPay(paymentResult) {
    snackbarKey.currentState!.showSnackBar(
      InfoSnackBar(
        contentText:
            AppLocalizations.of(snackbarKey.currentContext!)!.donateCubitCard,
      ),
    );
  }
}
