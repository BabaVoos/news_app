import 'package:route_news_app/data_layer/models/news_data_model.dart';
import 'package:route_news_app/data_layer/models/sources_model.dart';
import 'package:route_news_app/data_layer/repositories/base_repository.dart';
import 'package:route_news_app/data_layer/web_services/everything_web_services.dart';
import 'package:route_news_app/data_layer/web_services/sources_web_services.dart';

class RemoteDataSource extends BaseRepository {
  SourcesWebServices sourcesWebServices = SourcesWebServices();
  EveryThingWebServices everyThingWebServices = EveryThingWebServices();

  @override
  Future<NewsDatModel> getNews(String sourceId) async {
    return await EveryThingWebServices.getNewsData(sourceId);
  }

  @override
  Future<NewsDatModel> getSearchResults(
      String sourceId, String searchText) async {
    return await EveryThingWebServices.getSearchData(sourceId, searchText);
  }

  @override
  Future<SourcesModel> getSources(String categoryId) async {
    return await SourcesWebServices.getSources(categoryId);
  }
}
