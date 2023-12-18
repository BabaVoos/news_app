import 'package:flutter/material.dart';
import 'package:route_news_app/core/helpers.dart';
import 'package:route_news_app/data_layer/web_services/everything_web_services.dart';
import 'package:route_news_app/modules/category/widgets/news_item.dart';
import 'package:route_news_app/modules/category/widgets/source_item.dart';

import '../../../data_layer/models/source_model.dart';

class SourceTitle extends StatefulWidget {
  List<Sources> sources;

  SourceTitle({
    Key? key,
    required this.sources,
  }) : super(key: key);

  @override
  State<SourceTitle> createState() => _SourceTitleState();
}

class _SourceTitleState extends State<SourceTitle> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 16,
        bottom: 16,
        start: 16,
      ),
      child: Column(
        children: [
          DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              physics: const BouncingScrollPhysics(),
              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              tabs: widget.sources.map((e) {
                return SourceItem(
                  text: e.name!,
                  isSelected: widget.sources.indexOf(e) == index ? true : false,
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: EveryThingWebServices.getNewsData(
              widget.sources[index].id!,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  children: [
                    SizedBox(
                      height: context.screenHeight / 2.5,
                    ),
                    const CircularProgressIndicator(
                      color: Color(0XFF39A552),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    SizedBox(
                      height: context.screenHeight / 2.5,
                    ),
                    Text(
                      snapshot.error.toString(),
                    ),
                  ],
                );
              } else {
                var articles = snapshot.data!.articles;
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      endIndent: 20,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var article = articles[index];
                      return NewsItem(articles: article);
                    },
                    itemCount: articles!.length,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
