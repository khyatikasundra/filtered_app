import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetFilteredList extends HomeEvent {}

class OnCategorySelectionEvent extends HomeEvent {
  final int index;
  OnCategorySelectionEvent({required this.index});
}

class OnPriceRangeSelectionEvent extends HomeEvent {
  final int index;
  OnPriceRangeSelectionEvent({required this.index});
}

class OnClickFavoriteIconEvent extends HomeEvent {
  final int index;
  OnClickFavoriteIconEvent({required this.index});
}
