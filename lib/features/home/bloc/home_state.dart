part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<ArticleModel> articles;

  HomeSuccessState({required this.articles});
}

class HomeErrorState extends HomeState {}
