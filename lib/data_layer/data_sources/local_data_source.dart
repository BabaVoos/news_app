import 'package:route_news_app/data_layer/models/news_data_model.dart';
import 'package:route_news_app/data_layer/models/sources_model.dart';
import 'package:route_news_app/data_layer/repositories/base_repository.dart';

class LocalDataSource extends BaseRepository {
  @override
  Future<NewsDatModel> getNews(String sourceId) {
    // TODO: implement getNews
    throw UnimplementedError();
  }

  @override
  Future<NewsDatModel> getSearchResults(String sourceId, String searchText) {
    // TODO: implement getSearchResults
    throw UnimplementedError();
  }

  @override
  Future<SourcesModel> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}
