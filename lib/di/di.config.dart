// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/apiManger.dart' as _i79;
import '../Home/categories.dart/cubit/categoryDetailsCubitViewModel.dart'
    as _i276;
import '../Home/news/cubit/newsWidgetCubitViewModel.dart' as _i735;
import '../reposatiry/news/dataSource/newsRemoteDatSourceimpi.dart' as _i1006;
import '../reposatiry/news/newsDataSource.dart' as _i29;
import '../reposatiry/news/newsReposatiryContarct.dart' as _i649;
import '../reposatiry/news/reposatiry/newsReposatiryimpi.dart' as _i843;
import '../reposatiry/sources/dataSource/sourceOfflineDataSourceimpl.dart'
    as _i858;
import '../reposatiry/sources/dataSource/sourceRemoteDataSourceimpi.dart'
    as _i1060;
import '../reposatiry/sources/reposatiry/sourceReposatriyimpi.dart' as _i390;
import '../reposatiry/sources/sourceDataSource.dart' as _i130;
import '../reposatiry/sources/sourceRepoContract.dart' as _i149;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i79.Apimanger>(() => _i79.Apimanger());
    gh.factory<_i29.newsRemoteDataSource>(
        () => _i1006.Newsremotedatsourceimpi(apimanger: gh<_i79.Apimanger>()));
    gh.factory<_i130.sourceRemoteDataSource>(() =>
        _i1060.Sourceremotedatasourceimpi(apimanger: gh<_i79.Apimanger>()));
    gh.factory<_i130.sourceOfflineDataSource>(
        () => _i858.Sourceofflinedatasourceimpl());
    gh.factory<_i149.Sourcerepocontract>(() => _i390.Sourcereposatriyimpi(
          remoteDataSource: gh<_i130.sourceRemoteDataSource>(),
          offlineDataSource: gh<_i130.sourceOfflineDataSource>(),
        ));
    gh.factory<_i276.Categorydetailscubitviewmodel>(() =>
        _i276.Categorydetailscubitviewmodel(
            sourcerepo: gh<_i149.Sourcerepocontract>()));
    gh.factory<_i649.Newsreposatirycontarct>(() => _i843.Newsreposatiryimpi(
        remoteDataSource: gh<_i29.newsRemoteDataSource>()));
    gh.factory<_i735.Newswidgetcubitviewmodel>(() =>
        _i735.Newswidgetcubitviewmodel(
            newsRepo: gh<_i649.Newsreposatirycontarct>()));
    return this;
  }
}
