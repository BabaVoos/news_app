import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_news_app/core/helpers.dart';
import 'package:route_news_app/data_layer/models/news_data_model.dart';
import 'package:route_news_app/modules/news_details/news_details_view.dart';

class NewsItem extends StatelessWidget {
  Articles articles;

  NewsItem({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          widget: NewsDetailsView.routeName,
          arguments: articles,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: articles.title!,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                    8,
                  ),
                  topRight: Radius.circular(
                    8,
                  ),
                ),
                child: Image.network(
                  articles.urlToImage ?? "",
                  height: context.screenHeight * 0.2,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) => const Text(
                    'ooops Error With Image Not Found',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              articles.source!.name ?? "",
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
              articles.title ?? "",
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
                  articles.publishedAt!.substring(0, 10),
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0XFF79828B),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
