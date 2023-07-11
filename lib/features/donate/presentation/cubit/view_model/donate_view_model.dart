import '../../../../../core/presentation/base_view_model.dart';

class DonateViewModel extends BaseViewModel{
  List<int> amounts;
  int? selectedAmount;

  DonateViewModel({this.amounts = const [10, 20, 30, 40, 50, 100], this.selectedAmount});

  DonateViewModel copyWith({
    List<int>? amounts,
    int? selectedAmount,
  }) {
    return DonateViewModel(
      amounts: amounts ?? this.amounts,
      selectedAmount: selectedAmount ?? this.selectedAmount,
    );
  }

  @override
  List<Object?> get props => [amounts, selectedAmount];
}