import 'package:flutter/material.dart';
import 'package:news_refresh/api_maneger.dart';
import 'package:news_refresh/models/NewsResponse.dart';
import 'package:news_refresh/models/SourcesResponse.dart';
import 'package:news_refresh/news_screens/news_item.dart';

class NewsContanier extends StatefulWidget {
  Sources sources;

  NewsContanier(this.sources);

  List<News> news = [];

  @override
  State<NewsContanier> createState() => _NewsContanierState();
}

class _NewsContanierState extends State<NewsContanier> {
  late ScrollController scrollController;
  bool shouldLoading = false;
  int page = 1;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (isTop) {
        } else {
          shouldLoading = true;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shouldLoading == true) {
      ApiManeger.getNews(source: widget.sources.id, page: ++page)
          .then((newsResponse) {
        if (newsResponse != null) {
          setState(() {
            widget.news.addAll(newsResponse.articles!.toList());
            shouldLoading = false;
          });
        }
      });
    }
    return Container(
      child: Column(
        children: [
          FutureBuilder<NewsResponse>(
              future: ApiManeger.getNews(source: widget.sources.id ?? ""),
              builder: (context, snapShot) {
                if (snapShot.hasError) {
                  return Text("Try Again");
                }
                if (snapShot.hasData) {
                  if (widget.news.isEmpty) {
                    widget.news = snapShot.data!.articles ?? [];
                  } else if (widget.news.elementAt(0).title ==
                      snapShot.data!.articles![0].title) {
                    // scrollController.jumpTo(0);
                    widget.news = [];
                    widget.news = snapShot.data!.articles ?? [];
                  }
                  return Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        print(index);
                        return NewsItem(widget.news[index]);
                      },
                      itemCount: widget.news.length,
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
    );
  }
}
