import 'package:flutter/material.dart';
import 'package:news_refresh/models/NewsResponse.dart';
import 'package:news_refresh/news_screens/news_details.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.screenName, arguments: news);
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(12),
        width: double.infinity,
        height: 310,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              news.urlToImage ?? "",
              height: 230,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            // SizedBox(height: MediaQuery.of(context).size.height *0.01,),
            Expanded(child: Text(news.title ?? "")),
            Expanded(child: Text(news.author ?? "")),
            Expanded(
                child: Text(
              news.publishedAt ?? "",
              textAlign: TextAlign.end,
            ))
          ],
        ),
      ),
    );
  }
}
