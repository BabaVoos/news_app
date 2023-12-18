import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_news_app/data_layer/models/news_data_model.dart';
import 'package:route_news_app/data_layer/repositories/base_repository.dart';
import 'package:route_news_app/modules/search/cubit/states.dart';

class SearchViewCubit extends Cubit<SearchViewStates> {
  BaseRepository baseRepository;

  SearchViewCubit(this.baseRepository) : super(SearchViewInitState());

  static SearchViewCubit get(context) => BlocProvider.of(context);

  NewsDatModel? newsDatModel;
  List<Articles> articles = [];

  getSearchData({required String sourceId, required String searchText}) async {
    try {
      emit(SearchViewGetDataLoadingState());
      newsDatModel =
          await baseRepository.getSearchResults(sourceId, searchText);
      articles = newsDatModel!.articles!;
      emit(SearchViewGetDataSuccessState());
    } catch (e) {
      emit(
        SearchViewGetDataErrorState(error: e.toString()),
      );
    }
  }
}
