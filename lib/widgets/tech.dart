import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:read_news/data/news.dart';

Future<ReadNews> _fetcTech() async {
  var dio = Dio();
  final response = await dio.get(
      'https://newsapi.org/v2/everything?q=technology&apiKey=07d00b8b18374b3286fcf7e91c762857');
  if (response.statusCode == 200) {                                 
    return ReadNews.fromJson(response.data);
  } else {
    throw Exception('Gagal get data');
  }
}

class Tech extends StatefulWidget {
  const Tech({Key key}) : super(key: key);

  @override
  _TechState createState() => _TechState();
}

class _TechState extends State<Tech> {
  Future<ReadNews> readTech;

  @override
  void initState() {
    super.initState();
    readTech = _fetcTech();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<ReadNews>(
          future: readTech,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.articles.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              width: 115,
                              height: 66.97,
                              child: Image.network(
                                  snapshot.data.articles[index].urlToImage),
                            ),
                            title: Text(
                              snapshot.data.articles[index].title.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              snapshot.data.articles[index].description
                                  .toString(),
                              maxLines: 3,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Text(snapshot.data.articles[index].author),
                              Text(snapshot.data.articles[index].publishedAt),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}