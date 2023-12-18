import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_news_app/core/helpers.dart';
import 'package:route_news_app/core/widgets/my_container.dart';
import 'package:route_news_app/data_layer/models/news_data_model.dart';
import 'package:route_news_app/modules/news_details/widgets/article_container.dart';

class NewsDetailsView extends StatelessWidget {
  static const String routeName = 'newsDetails';

  const NewsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Articles;
    return MyContainer(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: context.screenHeight * 0.075,
          title: Text(args.source!.name!),
        ),
        body: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              Hero(
                tag: args.title!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    errorBuilder: (context, error, stackTrace) => const Text(
                      'ooops Error With Image Not Found',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    height: context.screenHeight * 0.25,
                    args.urlToImage!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                args.source!.name!,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0XFF79828B),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                args.title ?? "",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0XFF42505C),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Spacer(),
                  Text(
                    args.publishedAt!.substring(0, 10),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF79828B),
                    ),
                  ),
                ],
              ),
              ArticleContainer(
                article: args,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
