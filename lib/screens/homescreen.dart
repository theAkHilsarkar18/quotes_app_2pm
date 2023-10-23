import 'package:flutter/material.dart';
import 'package:quotes_app_2pm/screens/imagescreen.dart';
import 'package:quotes_app_2pm/utils/custom_widgets.dart';
import 'package:quotes_app_2pm/utils/quoteslist.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../utils/colorpalate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Are you sure want to exit ?'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text('No')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text('Yes')),
              ],
            ),
          );
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
            title: const Text(
              'My Quotes',
              style: TextStyle(color: Colors.white, letterSpacing: 2),
            ),
          ),
          body: Center(
            child: CarouselSlider.builder(
              itemCount: imgList.length,
              itemBuilder: (context, index, realIndex) =>
                  Container(
                    height: 200,
                      width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue
                    ),
                  ),
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 1,
                enlargeCenterPage: true,
                initialPage: 2,
                scrollDirection: Axis.vertical,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

int imageIndex = 0;

// list - random quotes
// on click -> open quotes
// background image -> relevant image
// change background image
// font color and font style
// add to favourite
// save - share
