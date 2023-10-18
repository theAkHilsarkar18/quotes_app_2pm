import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogueScreen extends StatelessWidget {
  const DialogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dialogue Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No')),
                            ElevatedButton(
                                onPressed: () {}, child: const Text('Yes'))
                          ],
                          title: const Text('Have you car ?'),
                        );
                      },
                    );
                  },
                  child: const Text("Alert Dialogue")),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: const Text('This is simple dialogue'),
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('No')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('Yes'))
                        ],
                      ),
                    );
                  },
                  child: const Text('Simple Dialogue')),
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Hello ALL',
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Colors.white,
                    ));
                  },
                  child: const Text('Snack bar')),


              CupertinoButton(onPressed: () {
                showDialog(context: context, builder: (context) => CupertinoAlertDialog(
                  title: Text('Cupertino Dialogue'),
                  actions: [
                    CupertinoButton(child: Text('No'), onPressed: () {

                    },),
                    CupertinoButton(child: Text('Yes'), onPressed: () {

                    },),
                  ],
                ),);
              }, child: Text('Cupertino Dialog')),

            ],
          ),
        ),
      ),
    );
  }
}



// list with good ui - listview builder
// button click  - dialogue -> random quotes -> random function