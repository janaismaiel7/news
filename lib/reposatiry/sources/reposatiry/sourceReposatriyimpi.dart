import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news/model/source_response/source_response.dart';
import 'package:news/reposatiry/sources/sourceDataSource.dart';
import 'package:news/reposatiry/sources/sourceRepoContract.dart';

@Injectable(as: Sourcerepocontract)
class Sourcereposatriyimpi implements Sourcerepocontract {
  final sourceRemoteDataSource remoteDataSource;
  final sourceOfflineDataSource offlineDataSource;

  Sourcereposatriyimpi({
    required this.remoteDataSource,
    required this.offlineDataSource,
  });

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    // Perform asynchronous connectivity check
    var checkResult = await Connectivity().checkConnectivity();

    if (checkResult.contains(ConnectivityResult.wifi)|| checkResult.contains(ConnectivityResult.mobile)){
      try {
        var sourceResponse = await remoteDataSource.getSources(categoryId);
        if (sourceResponse != null) {
          // Await the saveSources operation
          await offlineDataSource.saveSources(sourceResponse, categoryId);
        }
        return sourceResponse;
      } catch (e) {
       
        return null;
      }
    } else {
      // No internet connection, fallback to offline data
      try {
        return await offlineDataSource.getSources(categoryId);
      } catch (e) {
        // Handle any errors that occur during the offline fetch
        return null;
      }
    }
  }
}
