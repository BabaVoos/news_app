abstract class CategoryViewStates {}

class CategoryViewInitState extends CategoryViewStates {}

class CategoryViewLoadingSourcesState extends CategoryViewStates {}

class CategoryViewChangeIndexOfTab extends CategoryViewStates {}

class CategoryViewGetSourcesSuccessState extends CategoryViewStates {}

class CategoryViewGetSourcesErrorState extends CategoryViewStates {
  final String error;

  CategoryViewGetSourcesErrorState({required this.error});
}

class CategoryViewGetNewsLoadingState extends CategoryViewStates {}

class CategoryViewGetNewsSuccessState extends CategoryViewStates {}

class CategoryViewGetNewsErrorState extends CategoryViewStates {
  final String error;

  CategoryViewGetNewsErrorState({required this.error});
}
