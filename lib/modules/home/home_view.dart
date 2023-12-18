import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_news_app/core/helpers.dart';
import 'package:route_news_app/core/widgets/my_container.dart';
import 'package:route_news_app/modules/home/cubit/cubit.dart';
import 'package:route_news_app/modules/home/widgets/my_drawer.dart';
import 'package:route_news_app/modules/search/search_view.dart';

import 'cubit/states.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'home';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return MyContainer(
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: context.screenHeight * 0.075,
                title: Text(
                  cubit.screenTitle(context),
                ),
                actions: [
                  cubit.selectedCategory != null
                      ? Padding(
                          padding: const EdgeInsetsDirectional.only(end: 10),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                SearchView.routeName,
                                arguments: cubit.selectedCategory!.id,
                              );
                            },
                            icon: const Icon(
                              Icons.search_rounded,
                              size: 30,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              drawer: MyDrawer(
                settingsOnClicked: () {
                  cubit.settingsOnClicked(context);
                },
                categoriesOnClicked: () {
                  cubit.categoriesOnClicked(context);
                },
              ),
              body: cubit.buildBody(),
            ),
          );
        },
      ),
    );
  }
}
