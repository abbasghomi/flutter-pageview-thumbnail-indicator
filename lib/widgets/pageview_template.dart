import 'package:flutter/material.dart';

class PageViewTemplate extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String text;

  const PageViewTemplate(
      {Key? key,
      required this.imageAsset,
      required this.title,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            width: pageWidth * 75 / 100,
            child: Image(
              image: AssetImage(
                imageAsset,
              ),
              fit: BoxFit.cover,
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 24.0),
              )),
          Center(
            child: Container(
                width: pageWidth * 70 / 100,
                child: Text(
                  text,
                  style: TextStyle(fontSize: 14.0),
                )),
          )
        ],
      ),
    );
  }
}
