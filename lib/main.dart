import 'dart:io';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_excel/excel.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';
import 'handlingExcelFiles.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController BillNo=TextEditingController();
  TextEditingController bookName=TextEditingController();
  TextEditingController Auther=TextEditingController();
  TextEditingController Price=TextEditingController();

    @override
    Widget build(BuildContext context) {
      FilePickerResult? result;
      File? file;
      Excelfiles excelobj=new Excelfiles();

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: BillNo,
                decoration: InputDecoration(
                  labelText: 'Bill No',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: bookName,
                decoration: InputDecoration(
                  labelText: 'Book Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: Auther,
                decoration: InputDecoration(
                  labelText: 'Author',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: Price,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                //  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 24),
               ElevatedButton(
                onPressed: () async {
                  final bookDetails = [
                    bookName.text,
                    Auther.text,
                    Price.text,
                  ];

                 excelobj.createexcelfile(bookDetails,BillNo.text);
                  clear();
                },
                child: const Text('create an excel file'),
              ),


            ],
          ),
        ),
       // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
  @override
  void clear() {
      BillNo.clear();
      bookName.clear();
      Auther.clear();
      Price.clear();

  }
  }



