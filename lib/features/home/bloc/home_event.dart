part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeApplySearchEvent extends HomeEvent {
  final RequestQuery requestQuery;

  HomeApplySearchEvent({required this.requestQuery});
}
