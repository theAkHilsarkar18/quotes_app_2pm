import 'package:flutter/material.dart';
import 'package:quotes_app_2pm/utils/custom_widgets.dart';
import 'package:quotes_app_2pm/utils/quoteslist.dart';

import '../utils/colorpalate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'My Quotes',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: 1),
          ),
        ),
        backgroundColor: Colors.black,
        body: ListView.builder(
          itemBuilder: (context, index) => quotesBox(
            quotesList[index]['quote'],
            quotesList[index]['author'],
          ),
          itemCount: quotesList.length,
        ),
      ),
    );
  }
}
// list - random quotes
// on click -> open quotes
// background image -> relevant image
// change background image
// font color and font style
// add to favourite


