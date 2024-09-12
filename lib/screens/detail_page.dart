import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:quotes_app_11am/utils/globals.dart';

import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  GlobalKey imgKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green.shade800,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: RepaintBoundary(
                  key: imgKey,
                  child: Card(
                    child: Align(
                      alignment: currentAlignment,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(currentImage,),),
                        ),
                        child: Transform.translate(
                          offset: Offset(x, y),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SelectableText(quote!.quote,style:  TextStyle(fontSize: 25,fontFamily: currentFont,color: currentColor),),
                              SelectableText(quote!.author,style:  TextStyle(fontSize: 18,fontFamily: currentFont,color: currentColor),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                IconButton.filled(onPressed: () {
                  setState(() {
                    y+=5;
                  });
                }, icon: const Icon(Icons.arrow_downward),),
                  IconButton.filled(onPressed: () {
                    setState(() {
                      y-=5;
                    });
                  }, icon: const Icon(Icons.arrow_upward),),
                  IconButton.filled(onPressed: () {
                    setState(() {
                      x = 0;
                      y = 0;
                      currentAlignment = Alignment.center;
                    });
                  }, icon: const Icon(Icons.center_focus_strong_outlined),),
                  IconButton.filled(onPressed: () {
                    ClipboardData data = ClipboardData(text: "${quote!.quote}\n${quote!.author}");
                   Clipboard.setData(data);
                  }, icon: const Icon(Icons.copy),),
                  IconButton.filled(onPressed: () async {
                    RenderRepaintBoundary boundary = imgKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
                    final image = await boundary.toImage();
                    final byteData = await image.toByteData(format: ImageByteFormat.png);
                    log(byteData.hashCode.toString());
                    if(byteData!=null)
                      {
                        final uint8List = byteData.buffer.asUint8List();
                        log(uint8List.toString());
                        await ImageGallerySaver.saveImage(uint8List);
                      }
                  }, icon: const Icon(Icons.save),),

                  IconButton.filled(onPressed: () async {
                    RenderRepaintBoundary boundary = imgKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
                    ShareFilesAndScreenshotWidgets().shareScreenshot(imgKey, 500, "image", "quote.png", "image/png");
                  }, icon: const Icon(Icons.share),),

                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(fontList.length, (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        currentFont = fontList[index];
                      });
                    },
                    child: Card(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Font Style ${index+1}',style: TextStyle(fontFamily: fontList[index]),),
                    ),),
                  ),),
                ),
              ),
              const SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(colorList.length, (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        currentColor = colorList[index];
                      });
                    },
                    child: Card(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        width: 60,
                        color: colorList[index],
                      ),
                    ),),
                  ),),
                ),
              ),
              const SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(imgList.length, (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                       currentImage = imgList[index];
                      });
                    },
                    child: Card(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(imgList[index]),),
                        ),
                      ),
                    ),),
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// area - repaint boundary
/
