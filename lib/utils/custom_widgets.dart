
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app_2pm/utils/colorpalate.dart';

Widget quotesBox(String quote, String author)
{
  return Expanded(
    child: Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(20),

      width: 400,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(quote,style: const TextStyle(fontSize: 15,letterSpacing: 1,fontWeight: FontWeight.bold,color: Colors.white)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('~ $author',style: const TextStyle(fontSize: 10,fontWeight: FontWeight.w500,letterSpacing: 1,color:Colors.white ),),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}