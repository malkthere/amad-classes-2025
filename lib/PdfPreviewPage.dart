import 'dart:typed_data';

import 'package:amad/sell_A_Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  List<Product> text;
  int total2;
  int invoiveNo;
  PdfPreviewPage(this.text,this.total2,this.invoiveNo, {Key? key}) : super(key: key);
//String xxx= this.xyz;
  static late pw.Font arfont;

  static init() async {
    arfont = pw.Font.ttf((await rootBundle.load("assets/fonts/Cairo-VariableFont_slnt,wght.ttf")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(),
      ),
    );
  }

  Future<Uint8List> makePdf() async {

    final pdf = pw.Document(title: "maz", author: "maz-maz");
    final ByteData bytes = await rootBundle.load('assets/phone.png');
    final Uint8List byteList = bytes.buffer.asUint8List();

    pdf.addPage(
        pw.Page(
            textDirection: pw.TextDirection.rtl,
            theme: pw.ThemeData.withFont(
              base: pw.Font.ttf(await rootBundle.load("assets/fonts/Cairo-VariableFont_slnt,wght.ttf")),
            ),
            margin: const pw.EdgeInsets.all(10),
            pageFormat: PdfPageFormat.a4,
            build: (context) {
              return pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                       // mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Image(pw.MemoryImage(byteList), fit: pw.BoxFit.fill, height: 150, width: 600),
                          pw.Header(text: "فاتورة مبيعات رقم.  ${invoiveNo}", level: 1)
                        ]
                    ),
                    pw.Divider(borderStyle: pw.BorderStyle.dashed),
                   // pw.Text(" ", style: pw.TextStyle(fontSize: 6)),
                    pw.Text("customer name :  "+ text[0].costname, style: pw.TextStyle(fontSize: 12)),
                   // pw.Divider(thickness: 1),
                    pw.Divider(thickness: 1),


                    pw.Table(
                        children: [
                          for (var i = 0; i < text.length; i++)
                            pw.TableRow(
                                children: [
                                  pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: pw.MainAxisAlignment.center,
                                      children: [
                                        pw.Text(text[i].proname,
                                            style: pw.TextStyle(fontSize: 6)),
                                        pw.Divider(thickness: 1)
                                      ]
                                  ),
                                  pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: pw.MainAxisAlignment.center,
                                      children: [
                                        pw.Text(text[i].price,
                                            style: pw.TextStyle(fontSize: 6)),
                                        pw.Divider(thickness: 1)
                                      ]
                                  ),
                                  pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: pw.MainAxisAlignment.center,
                                      children: [
                                        pw.Text(text[i].quantaty,
                                            style: pw.TextStyle(fontSize: 6)),
                                        pw.Divider(thickness: 1)
                                      ]
                                  ),
                                  pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: pw.MainAxisAlignment.center,
                                      children: [
                                        pw.Text(text[i].total.toString(),
                                            style: pw.TextStyle(fontSize: 6)),
                                        pw.Divider(thickness: 1)
                                      ]
                                  )
                                ]
                            )
                        ]
                    ),
                    pw.Table(
                        children: [

                            pw.TableRow(
                                children: [
                                  pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: pw.MainAxisAlignment.center,
                                      children: [
                                        pw.Text("",
                                            style: pw.TextStyle(fontSize: 6)),
                                        pw.Divider(thickness: 1)
                                      ]
                                  ),
                                  pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: pw.MainAxisAlignment.center,
                                      children: [
                                        pw.Text("",
                                            style: pw.TextStyle(fontSize: 6)),
                                        pw.Divider(thickness: 1)
                                      ]
                                  ),
                                  pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: pw.MainAxisAlignment.center,
                                      children: [
                                        pw.Text("",
                                            style: pw.TextStyle(fontSize: 6)),
                                        pw.Divider(thickness: 1)
                                      ]
                                  ),
                                  pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                                      mainAxisAlignment: pw.MainAxisAlignment.center,
                                      children: [
                                        pw.Text(total2.toString()+"-RY",
                                            style: pw.TextStyle(fontSize: 6)),
                                        pw.Divider(thickness: 1)
                                      ]
                                  )
                                ]
                            )
                        ]
                    )


                  ]
              );
            }
        )
    );

    return pdf.save();
  }
}