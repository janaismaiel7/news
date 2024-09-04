import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news/model/source_response/source_response.dart';
import 'package:news/reposatiry/sources/sourceDataSource.dart';
 @Injectable(as: sourceOfflineDataSource)
class Sourceofflinedatasourceimpl implements sourceOfflineDataSource {
  @override
  Future<SourceResponse> getSources(String categoryId) async {
    var box = await Hive.openBox('tabs');
    var data =SourceResponse.fromJson(box.get(categoryId)) ;//map=> object
    return data;
  }

  @override
  Future<void> saveSources(SourceResponse? SourceResponse,String category) async {
    var box = await Hive.openBox('tabs');
    await box.put('tab', SourceResponse?.toJson());//map
    await box.close();
  }
}
