import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/Home/news/cubit/newsStates.dart';
import 'package:news/reposatiry/news/newsReposatiryContarct.dart';

@injectable
class Newswidgetcubitviewmodel extends Cubit<Newsstates> {
  final Newsreposatirycontarct newsRepo;

  Newswidgetcubitviewmodel({required this.newsRepo}) : super(newsLoadingState());

  // Method to fetch news by source ID
  void getNewsBySourceId(String sourceId) async {
    try {
      emit(newsLoadingState());
      var response = await newsRepo.getNewsBySourceId(sourceId);

      // Ensure the response is valid and has a status of 'ok'
      if (response?.status != 'ok') {
        emit(newsErrorState(errrorMessage: response?.message ?? 'Unknown Error'));
        return;
      }

      // Emit success state with the list of articles
      emit(newsSucessState(newsList: response?.articles ?? []));
    } catch (e) {
      emit(newsErrorState(errrorMessage: e.toString()));
    }
  }
}
