import 'package:route_news_app/data_layer/models/news_data_model.dart';
import 'package:route_news_app/data_layer/models/sources_model.dart';

abstract class BaseRepository {
  Future<SourcesModel> getSources(String categoryId);

  Future<NewsDatModel> getNews(String sourceId);

  Future<NewsDatModel> getSearchResults(String sourceId, String searchText);
}
