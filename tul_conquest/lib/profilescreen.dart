import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

int points = 10;

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text("Profil"), backgroundColor: Colors.indigo[800]),
        body: Center(
          child:
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.75,
              padding: EdgeInsets.all(10),
              child: Stack(children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'TWOJE PUNKTY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28
                    ),
                  )
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              spreadRadius: 10,
                              offset: Offset(4,4)
                          )
                        ]
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          '$points',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 70
                        ),
                      ),
                    )
                ))
              ])
            ),
        ));
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/counter.txt');
}

Future<File> writeCounter(int counter) async {
  final file = await _localFile;

  // Write the file.
  return file.writeAsString('$counter');
}

Future<int> readCounter() async {
  try {
    final file = await _localFile;

    // Read the file.
    String contents = await file.readAsString();

    return int.parse(contents);
  } catch (e) {
    // If encountering an error, return 0.
    return 0;
  }
}
