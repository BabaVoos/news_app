import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_news_app/core/helpers.dart';
import 'package:route_news_app/core/widgets/my_container.dart';
import 'package:route_news_app/data_layer/data_sources/remote_data_source.dart';
import 'package:route_news_app/modules/search/cubit/cubit.dart';
import 'package:route_news_app/modules/search/cubit/states.dart';
import 'package:route_news_app/modules/search/widgets/search_text_field.dart';

import '../category/widgets/news_item.dart';

class SearchView extends StatelessWidget {
  static const String routeName = 'search';

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    return MyContainer(
      child: BlocProvider(
        create: (context) => SearchViewCubit(RemoteDataSource()),
        child: BlocConsumer<SearchViewCubit, SearchViewStates>(
          listener: (context, state) {
            if (state is SearchViewGetDataErrorState) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            var cubit = SearchViewCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: context.screenHeight * 0.090,
                title: SearchTextField(
                  searchController: searchController,
                  onSuffixTap: () {
                    cubit.getSearchData(
                      searchText: searchController.text,
                      sourceId: args.toString(),
                    );
                  },
                ),
              ),
              body: state is SearchViewGetDataLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          endIndent: 20,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var article = cubit.articles[index];
                          return NewsItem(articles: article);
                        },
                        itemCount: cubit.articles.length,
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
