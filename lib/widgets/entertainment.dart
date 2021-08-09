import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:read_news/data/news.dart';

Future<ReadNews> _fetchEntertaint() async {
  var dio = Dio();
  final response = await dio.get(
      'https://newsapi.org/v2/everything?q=entertainment&apiKey=07d00b8b18374b3286fcf7e91c762857');
  if (response.statusCode == 200) {
    return ReadNews.fromJson(response.data);
  } else {
    throw Exception('Gagal get data');
  }
}

class Entertainment extends StatefulWidget {
  const Entertainment({Key key}) : super(key: key);

  @override
  _EntertainmentState createState() => _EntertainmentState();
}

class _EntertainmentState extends State<Entertainment> {
  Future<ReadNews> readEntertainment;
  @override
  void initState() {
    readEntertainment = _fetchEntertaint();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<ReadNews>(
          future: readEntertainment,
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
