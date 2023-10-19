import 'package:flutter/material.dart';
import 'package:quotes_app_2pm/screens/homescreen.dart';
import 'package:quotes_app_2pm/utils/quoteslist.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Quote Screen"),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              3,
              (index) => TextButton(
                  onPressed: () {
                    setState(() {
                      img = imgList[index];
                      font = fontStyle[index];
                    });
                  },
                  child: Text('${index + 1}'))),
        ),
        body: Center(
          child: suvicharBox(img),
        ),
      ),
    );
  }
}

Widget suvicharBox(String img) {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    height: 450,
    width: 350,
    decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50), topLeft: Radius.circular(50))),
    child: Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
          child: Image.asset(
            '$img',
            fit: BoxFit.cover,
          ),
        ),
        Center(child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SelectableText('${quotesList[imageIndex]['quote']}',style: TextStyle(fontSize: 20,letterSpacing: 0.5,fontFamily: '$font'),),
        )),
      ],
    ),
  );
}

String img = 'assets/images/1.jpg';
String font = 'Quicksand';
List imgList = [
  'assets/images/1.jpg',
  'assets/images/2.jpg',
  'assets/images/3.jpg',
];

List fontStyle = [
  'DancingScript',
  'Quicksand',
  'DancingScript'
];
