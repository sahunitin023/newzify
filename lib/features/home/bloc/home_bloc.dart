import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newzify/features/home/models/article_model.dart';
import 'package:newzify/features/home/models/request_query.dart';
import 'package:newzify/features/home/repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        List<ArticleModel> articles =
            await HomeRepo.getTopHeadlines(RequestQuery('in', 'general', ''));
        emit(HomeSuccessState(articles: articles));
      } catch (e) {
        emit(HomeErrorState());
      }
    });
  }
}
