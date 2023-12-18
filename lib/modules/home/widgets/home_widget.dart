import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_news_app/core/helpers.dart';
import 'package:route_news_app/modules/home/cubit/cubit.dart';
import 'package:route_news_app/modules/home/widgets/category_widget.dart';

import '../../../data_layer/models/category_model.dart';
import '../cubit/states.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(
            32.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                lang.pick_your_category_of_interest,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color(0XFF4F5A69),
                ),
              ),
              SizedBox(
                height: context.screenHeight / 40,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 7 / 8,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return CategoryWidget(
                    categoryModel: CategoryModel.categories[index],
                    index: index,
                    onClicked: () {
                      cubit.onClicked(CategoryModel.categories[index]);
                    },
                  );
                },
                itemCount: CategoryModel.categories.length,
              ),
            ],
          ),
        );
      },
    );
  }
}
