import 'package:flutter/material.dart';
import 'package:news_refresh/models/SourcesResponse.dart';
import 'package:news_refresh/news_screens/news_container.dart';
import 'package:news_refresh/news_screens/tab_widget.dart';

class TabContainer extends StatefulWidget {
  List<Sources> souceList;

  TabContainer(this.souceList);

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selctedSource = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.souceList.length,
            child: TabBar(
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  selctedSource = index;
                  setState(() {});
                },
                isScrollable: true,
                tabs: widget.souceList
                    .map((source) => TabWidget(source,
                        selctedSource == widget.souceList.indexOf(source)))
                    .toList())),
        Expanded(child: NewsContanier(widget.souceList[selctedSource]))
      ],
    );
  }
}
