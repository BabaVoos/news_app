import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_news_app/data_layer/data_sources/remote_data_source.dart';
import 'package:route_news_app/modules/category/cubit/cubit.dart';
import 'package:route_news_app/modules/category/cubit/states.dart';
import 'package:route_news_app/modules/category/widgets/source_title.dart';

import '../../data_layer/models/category_model.dart';

class CategoryView extends StatelessWidget {
  final CategoryModel categoryModel;

  CategoryView({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryViewCubit(RemoteDataSource())..getSources(categoryModel.id),
      child: BlocConsumer<CategoryViewCubit, CategoryViewStates>(
        listener: (context, state) {
          if (state is CategoryViewGetNewsLoadingState) {
            showDialog(
                context: context,
                builder: (context) => const CircularProgressIndicator(
                      color: Colors.green,
                    ));
          } else if (state is CategoryViewGetSourcesErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          var cubit = CategoryViewCubit.get(context);
          return state is CategoryViewLoadingSourcesState ||
                  state is CategoryViewGetNewsLoadingState
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )
              : SourceTitle(
                  sources: cubit.sources,
                );
        },
      ),
    );
  }
}
