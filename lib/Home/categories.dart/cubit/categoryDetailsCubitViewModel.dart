import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/Home/categories.dart/cubit/sourceStates.dart';
import 'package:news/api/apiManger.dart';
import 'package:news/reposatiry/sources/dataSource/sourceOfflineDataSourceimpl.dart';
import 'package:news/reposatiry/sources/dataSource/sourceRemoteDataSourceimpi.dart';
import 'package:news/reposatiry/sources/reposatiry/sourceReposatriyimpi.dart';
import 'package:news/reposatiry/sources/sourceDataSource.dart';
import 'package:news/reposatiry/sources/sourceRepoContract.dart';


@injectable
class Categorydetailscubitviewmodel extends Cubit<Sourcestates> {
  final Sourcerepocontract sourcerepo;

  Categorydetailscubitviewmodel({required this.sourcerepo}) 
      : super(sourceLoadingState());

  void getSources(String categoryId) async {
  try {
    emit(sourceLoadingState());
    var response = await sourcerepo.getSources(categoryId);

    if (response == null || response.status != 'ok') {
      emit(sourceErrorState(
        errorMessage: response?.message ?? 'Failed to fetch sources.',
      ));
      print('Error: ${response?.message ?? 'Failed to fetch sources.'}');
      return;
    }

    emit(sourceSuccessState(sourceList: response.sources));
  } catch (e, stackTrace) {
    emit(sourceErrorState(errorMessage: e.toString()));
    print('Error: $e');
    print('Stack trace: $stackTrace');
  }
}

}

