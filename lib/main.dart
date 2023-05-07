import 'package:flutter/material.dart';
import 'package:init_widgets/models/SG_feed_model.dart';
import 'package:init_widgets/stubs/r_multi_image_thread_stub.dart';
import 'package:init_widgets/stubs/r_post_stub.dart';
import 'package:init_widgets/widgets/r_bottom_sheet_feed.dart';
import 'package:init_widgets/widgets/r_single_photo_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<MediaData> images = [
    "https://media-cdn.tripadvisor.com/media/photo-s/03/9b/2f/5b/cairo.jpg",
    "https://media.istockphoto.com/id/1174818077/photo/mosque-and-pyramids.jpg?s=612x612&w=0&k=20&c=kewLXiirLBe_QOeAQ2MPNFk8S4oxcTFt0AMPQ4mAXKY=",
    "https://media.gettyimages.com/id/1306141437/photo/woman-standing-on-the-terrace-on-the-background-of-giza-pyramids.jpg?s=612x612&w=gi&k=20&c=Li9m0ly1X8KlWxsQuwWAkM1ihxcELqRCNW8kGk904PI="
  ].map((element) => MediaData(contentUrl: element)).toList();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body:
          // NewsFeedSwipable()
          MultiImageThreadStub(
        dateTime: DateTime.utc(2023, 3, 1),
        profileImageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
        username: 'John Doe',
        textContent: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        images: const [
          "https://images.ctfassets.net/hrltx12pl8hq/a2hkMAaruSQ8haQZ4rBL9/8ff4a6f289b9ca3f4e6474f29793a74a/nature-image-for-website.jpg?fit=fill&w=480&h=320",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
          "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80",
          // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
          // "https://media.istockphoto.com/id/1146517111/photo/taj-mahal-mausoleum-in-agra.jpg?s=612x612&w=0&k=20&c=vcIjhwUrNyjoKbGbAQ5sOcEzDUgOfCsm9ySmJ8gNeRk="
        ],
      ),

      //   SingleChildScrollView(
      // child: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     // ignore: prefer_const_literals_to_create_immutables
      //     children: <Widget>[
      //       PostStub(
      //         dateTime: DateTime.utc(2023, 3, 1),
      //         profileImageUrl:
      //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //         username: 'John Doe',
      //         textContent:
      //             'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      //         images: [
      //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //         ],
      //       ),
      //       PostStub(
      //         dateTime: DateTime.utc(2023, 2, 28),
      //         profileImageUrl:
      //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //         username: 'John Doe',
      //         textContent:
      //             "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.                    ",
      //         images: [
      //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //         ],
      //       ),
      //       PostStub(
      //         dateTime: DateTime.now(),
      //         profileImageUrl:
      //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //         username: 'John Doe',
      //         textContent:
      //             'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      //         images: [
      //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //         ],
      //       ),
      //       PostStub(
      //         dateTime: DateTime.utc(1999, 1),
      //         profileImageUrl:
      //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //         username: 'John Doe',
      //         textContent:
      //             'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      //         images: [
      //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1T8oQ2DjIgx7SR9_bZ6eDEHKKaRAEMAFzeH_onFjtfw&s",
      //         ],
      //       ),
      //     ],
      //   ),
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      // ),
      // ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
