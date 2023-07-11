import 'package:connectopia/features/donate/presentation/cubit/view_model/donate_view_model.dart';

import '../../../../app/base_cubit.dart';

class DonateCubit extends BaseCubit<DonateViewModel>{
  DonateCubit() : super(DonateViewModel());

  void selectAmount(int amount) {
    emit(state.copyWith(selectedAmount: amount));
  }
  
}