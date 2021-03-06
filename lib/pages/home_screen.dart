part of 'pages.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(length: 8, vsync: this);
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
            padding: const EdgeInsets.only(right: 13, top: 14),
            child: Icon(Icons.language, color: Colors.black),
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: controller,
          tabs: [
            Tab(child: Text("News", style: TextStyle(color: Colors.black))),
            Tab(child: Text("Covid-19", style: TextStyle(color: Colors.black))),
            Tab(
                child: Text("Entertainment",
                    style: TextStyle(color: Colors.black))),
            Tab(child: Text("Sports", style: TextStyle(color: Colors.black))),
            Tab(
                child:
                    Text("Technology", style: TextStyle(color: Colors.black))),
            Tab(child: Text("Busines", style: TextStyle(color: Colors.black))),
            Tab(child: Text("Politic", style: TextStyle(color: Colors.black))),
            Tab(child: Icon(Icons.edit, color: Colors.black, size: 17)),
            // travel explore, public, mode, language
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          News(),
          Covid(),
          Entertainment(),
          Sports(),
          Tech(),
          Business(),
          Political(),
          EdiHalaman(),
        ],
      ),
    );
  }
}
