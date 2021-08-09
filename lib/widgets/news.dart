import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:read_news/data/news.dart';

Future<ReadNews> _fetchData() async {
  var dio = Dio();
  final response = await dio.get(
      'https://newsapi.org/v2/everything?q=covid-19&apiKey=07d00b8b18374b3286fcf7e91c762857');
  if (response.statusCode == 200) {
    return ReadNews.fromJson(response.data);
  } else {
    throw Exception('Gagal get data');
  }
}

class News extends StatefulWidget {
  const News({Key key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  Future<ReadNews> readNews;

  @override
  void initState() {
    super.initState();
    readNews = _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<ReadNews>(
          future: readNews,
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
