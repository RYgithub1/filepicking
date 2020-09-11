import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

void main() => runApp(FilePicking());

class FilePicking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Picking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'File Picking'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String displayText = "ファイルの中身を表示";
  File _file;
  var content;
  Encoding encoding;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(displayText),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,


              child: Text("ファイル選択・取り込み"),
              onPressed: () async {
                // ファイルの取得,fileで格納ーーーーー
                File file = await FilePicker.getFile(
                  type: FileType.video,
                );
                // ファイルの中身を取得ーー上記file,読み込んだファイルからデータを取得
                // String fileText = await file.readAsString();
                // Future<String> readAsString({Encoding encoding: utf8});
                content = file.readAsBytesSync();
                // content = file.readAsStringSync({encoding: utf8});
                // content = file.readAsStringSync();
                // content = file.readAsBytes();
                // 画面に表示
                setState(() {
                  _file = content;
                  // displayText = fileText;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
