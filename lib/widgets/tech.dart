part of 'widgets.dart';

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
              return ListView.separated(
                itemCount: snapshot.data.articles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5, right: 4),
                    child: Row(
                      children: [
                        Image.network(
                          snapshot.data.articles[index].urlToImage,
                          height: 100,
                          width: 125,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data.articles[index].title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Author : ${snapshot.data.articles[index].author}",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${snapshot.data.articles[index].description}...",
                                  maxLines: 4,
                                ),
                                SizedBox(height: 7),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Published at : ${snapshot.data.articles[index].publishedAt}",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
