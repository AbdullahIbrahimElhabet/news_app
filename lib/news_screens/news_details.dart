import 'package:flutter/material.dart';
import 'package:news_refresh/models/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String screenName = "News DERT";
  late var url;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as News;
    url = args.url;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title ?? ""),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                args.urlToImage ?? "",
                height: 230,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(args.title ?? ""),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(args.author ?? ""),
              Text(
                args.publishedAt ?? "",
                textAlign: TextAlign.end,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(args.content ?? ""),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              IconButton(
                onPressed: () {
                  launchURL();
                },
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "View Full Article",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_right)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
