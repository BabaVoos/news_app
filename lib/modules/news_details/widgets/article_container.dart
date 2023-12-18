import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_news_app/data_layer/models/news_data_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleContainer extends StatelessWidget {
  final Articles article;

  const ArticleContainer({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: const Color(
          0XFFFFFFFF,
        ),
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            article.description!,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color(
                0XFF42505C,
              ),
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 120,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              _openArticleURL(article.url!);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'View Full Article',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0XFF42505C),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Color(0XFF42505C),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openArticleURL(String link) async {
    if (await launch(link)) {
      await canLaunch(link);
    } else {
      print(
        'object',
      );
    }
  }
}
