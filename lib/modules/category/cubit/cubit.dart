import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_news_app/data_layer/models/news_data_model.dart';
import 'package:route_news_app/data_layer/models/source_model.dart';
import 'package:route_news_app/data_layer/models/sources_model.dart';
import 'package:route_news_app/data_layer/repositories/base_repository.dart';
import 'package:route_news_app/modules/category/cubit/states.dart';

class CategoryViewCubit extends Cubit<CategoryViewStates> {
  BaseRepository baseRepository;

  CategoryViewCubit(this.baseRepository) : super(CategoryViewInitState());

  static CategoryViewCubit get(context) => BlocProvider.of(context);

  List<Sources> sources = [];
  List<Articles> articles = [];
  SourcesModel? sourcesModel;
  NewsDatModel? newsDatModel;
  int index = 0;

  void changeIndexOfTabController(int value) {
    index = value;
    emit(CategoryViewChangeIndexOfTab());
  }

  getSources(String category) async {
    try {
      emit(CategoryViewLoadingSourcesState());
      sourcesModel = await baseRepository.getSources(category);
      sources = sourcesModel!.sources!;
      emit(CategoryViewGetSourcesSuccessState());
    } catch (e) {
      emit(
        CategoryViewGetSourcesErrorState(error: e.toString()),
      );
    }
  }

  getNews(String sourceId) async {
    try {
      emit(CategoryViewGetNewsLoadingState());
      newsDatModel = await baseRepository.getNews(sourceId);
      articles = newsDatModel!.articles!;
      emit(CategoryViewGetNewsSuccessState());
    } catch (e) {
      emit(
        CategoryViewGetNewsErrorState(error: e.toString()),
      );
    }
  }
}
