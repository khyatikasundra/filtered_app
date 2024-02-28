import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class GetInitialDataEvent extends HomeEvent {}

class CategorySelectionEvent extends HomeEvent {
  final int index;
  CategorySelectionEvent({required this.index});
  @override
  List<Object?> get props => [index];
}

class PriceSelectionEvent extends HomeEvent {
  final int index;
  PriceSelectionEvent({required this.index});
  @override
  List<Object?> get props => [index];
}

class ItemLikeUnlikeEvent extends HomeEvent {
  final int index;
  ItemLikeUnlikeEvent({required this.index});
  @override
  List<Object?> get props => [index];
}

class GetFilteredListEvent extends HomeEvent {}
