abstract class SearchViewStates {}

class SearchViewInitState extends SearchViewStates {}

class SearchViewGetDataLoadingState extends SearchViewStates {}

class SearchViewGetDataSuccessState extends SearchViewStates {}

class SearchViewGetDataErrorState extends SearchViewStates {
  final String error;

  SearchViewGetDataErrorState({required this.error});
}
