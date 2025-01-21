import 'dart:io';
import 'package:flutter_excel/excel.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';



class Excelfiles {
  int _counter = 0;

  //get selectedExcel => null;
  var excel = Excel.createExcel();

  void createexcelfile(List<String> bookinfo) async{
    Sheet sheetObject = excel['فاتورة 02'];
    var cell = sheetObject.cell(CellIndex.indexByString("A1"));
    cell.value = 8; // dynamic values support provided;
    List<String> data = ["اسم الكتاب","الكاتب", "السعر"];
    sheetObject.appendRow(data);
    sheetObject.appendRow(bookinfo);
    saveExcel();

  }
  saveExcel() async {
    //request for storage permission
    var res = await Permission.storage.request();
    var fileBytes = excel.save();
    //var directory = await getApplicationDocumentsDirectory();

    File(join("/storage/emulated/0/Download/billNo03.xlsx"))
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
    //"/storage/emulated/0/Download/"  download folder address
    //excel2.xlsx is the file name "feel free to change the file name to anything you want"



  }



}