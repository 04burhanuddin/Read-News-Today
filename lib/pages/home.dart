import 'package:flutter/material.dart';
import 'package:read_news/themes.dart';
import 'package:read_news/widgets/business.dart' as business;
import 'package:read_news/widgets/edit.dart' as edit;
import 'package:read_news/widgets/entertainment.dart' as enterntainment;
import 'package:read_news/widgets/news.dart' as news;
import 'package:read_news/widgets/politic.dart' as political;
import 'package:read_news/widgets/sports.dart' as sports;
import 'package:read_news/widgets/tech.dart' as tech;

class HomeApp extends StatefulWidget {
  const HomeApp({Key key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Read",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 7),
              child: Text(
                "News Today",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFFFF6699),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 13, top: 10),
            child: Icon(Icons.language, color: Colors.black),
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: controller,
          tabs: [
            Tab(child: Text("News", style: tabText)),
            Tab(child: Text("Entertainment", style: tabText)),
            Tab(child: Text("Sports", style: tabText)),
            Tab(child: Text("Tech", style: tabText)),
            Tab(child: Text("Busines", style: tabText)),
            Tab(child: Text("Politic", style: tabText)),
            Tab(child: Icon(Icons.edit, color: Colors.black)),
            // travel explore, public, mode, language
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          news.News(),
          enterntainment.Entertainment(),
          sports.Sports(),
          tech.Tech(),
          business.Business(),
          political.Political(),
          edit.EdiHalaman(),
        ],
      ),
    );
  }
}
