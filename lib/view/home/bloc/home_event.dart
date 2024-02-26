import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnCategorySelectionEvent extends HomeEvent {
  final int index;
  OnCategorySelectionEvent({required this.index});
}

class OnPriceRangeSelectionEvent extends HomeEvent {
  final int index;
  OnPriceRangeSelectionEvent({required this.index});
}
