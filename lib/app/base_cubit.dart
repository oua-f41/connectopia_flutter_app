import 'package:bloc/bloc.dart';
import '../core/presentation/base_view_model.dart';

class BaseCubit<T extends BaseViewModel> extends Cubit<T> {
  BaseCubit(super.initialState);
}
