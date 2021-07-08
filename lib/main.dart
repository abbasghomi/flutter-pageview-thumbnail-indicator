import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pageviewthumbnail/widgets/pageview_template.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'PageView with thumbnail indicators'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pageController = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );
  final ValueNotifier<double> _currentPage = ValueNotifier<double>(0);

  String imageByIndex(int index) {
    switch (index) {
      case 1:
        return 'assets/images/1.png';
      case 2:
        return 'assets/images/2.png';
      case 3:
        return 'assets/images/3.png';
      case 4:
        return 'assets/images/4.png';
      case 5:
        return 'assets/images/5.png';
      case 6:
        return 'assets/images/6.png';
      default:
        return 'assets/images/1.png';
    }
  }

  List<Widget> get _pages => [
        PageViewTemplate(
          imageAsset: imageByIndex(1),
          title: 'Page 1',
          text: 'Page 1 description',
        ),
        PageViewTemplate(
          imageAsset: imageByIndex(2),
          title: 'Page 2',
          text: 'Page 2 description',
        ),
        PageViewTemplate(
          imageAsset: imageByIndex(3),
          title: 'Page 3',
          text: 'Page 3 description',
        ),
        PageViewTemplate(
          imageAsset: imageByIndex(4),
          title: 'Page 4',
          text: 'Page 4 description',
        ),
        PageViewTemplate(
          imageAsset: imageByIndex(5),
          title: 'Page 5',
          text: 'Page 5 description',
        ),
        PageViewTemplate(
          imageAsset: imageByIndex(6),
          title: 'Page 6',
          text: 'Page 6 description',
        ),
      ];

  Widget _indicator(int index, bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isActive ? 50 : 30.0,
      width: isActive ? 52 : 32,
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage(imageByIndex(index + 1)),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    var list = <Widget>[];
    for (var i = 0; i < _pages.length; i++) {
      list.add(
          i == _currentPage.value ? _indicator(i, true) : _indicator(i, false));
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _currentPage.value = _pageController.page ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: _pages,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder(
                valueListenable: _currentPage,
                builder: (context, _, __) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: _buildPageIndicator(),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
