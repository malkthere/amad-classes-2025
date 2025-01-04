Week 6: Session 2 - Working with Excel and PDF Files
________________________________________
Part 1: Working with Excel Files
1. What is an Excel File?
Excel files are spreadsheet documents commonly used for organizing and analyzing data. They are stored in formats such as .xls or .xlsx, which can contain data in rows and columns, charts, formulas, and more.
2. Why Use Excel in Mobile Apps?
•	Data Management: Excel files can store structured data such as employee records, sales data, and financial reports.
•	Data Analysis: Excel supports calculations and formulas, making it useful for analytical tasks.
•	Portability: Excel files can be shared easily across platforms and applications.
•	Business Use Cases: Generating reports, invoices, attendance logs, and exporting data.
________________________________________
3. How Does Flutter Handle Excel Files?
Flutter does not natively support Excel operations, but it can process Excel files using the excel package. This package enables reading, writing, and formatting data in Excel format.
________________________________________
4. Practical Example - Creating and Writing Excel Files
Step 1: Add Dependencies
Add the following dependencies in pubspec.yaml:
yaml
نسخ الكود
dependencies:
  excel: ^2.1.5
  path_provider: ^2.0.15
Step 2: Import Required Packages
dart
نسخ الكود
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
Step 3: Code for Writing Excel File
dart
نسخ الكود
Future<void> createExcelFile() async {
  // Create a new Excel document
  var excel = Excel.createExcel();

  // Add data to the first sheet
  Sheet sheet = excel['Sheet1'];
  sheet.appendRow(['ID', 'Name', 'Age']);
  sheet.appendRow([1, 'John Doe', 25]);
  sheet.appendRow([2, 'Jane Smith', 30]);

  // Save the Excel file
  final directory = await getApplicationDocumentsDirectory();
  final path = '${directory.path}/example.xlsx';
  File(path)
    ..createSync(recursive: true)
    ..writeAsBytesSync(excel.encode()!);

  print('Excel file saved at $path');
}
Step 4: Code for Reading Excel File
dart
نسخ الكود
Future<void> readExcelFile() async {
  final directory = await getApplicationDocumentsDirectory();
  final path = '${directory.path}/example.xlsx';
  var bytes = File(path).readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);

  // Print contents
  for (var table in excel.tables.keys) {
    print('Table: $table');
    for (var row in excel.tables[table]!.rows) {
      print('$row');
    }
  }
}
________________________________________
5. Key Features of Excel Operations
•	Dynamic Data Storage: Excel allows dynamic data insertion and organization.
•	Multi-Sheet Support: You can create multiple sheets for separate data categories.
•	Compatibility: Excel files can be easily opened and edited on various platforms, including mobile and desktop.
________________________________________
Part 2: Working with PDF Files
1. What is a PDF File?
A PDF (Portable Document Format) is a standardized file format developed by Adobe. It is widely used for presenting and sharing documents in a fixed layout, including text, images, tables, and forms.
2. Why Use PDF in Mobile Apps?
•	Reports and Invoices: PDFs are ideal for exporting business documents like reports and receipts.
•	Fixed Formatting: Content in PDFs maintains its layout across devices.
•	Print-Ready Output: PDFs can be directly printed without further processing.
•	Security Features: PDFs support encryption, password protection, and digital signatures.
________________________________________
3. How Does Flutter Handle PDF Files?
Flutter supports PDF creation and manipulation through the pdf and printing packages. These packages allow adding text, tables, and images to PDF documents and previewing or printing them.
________________________________________
4. Practical Example - Creating and Writing PDF Files
Step 1: Add Dependencies
Add the following dependencies in pubspec.yaml:
yaml
نسخ الكود
dependencies:
  pdf: ^3.10.4
  path_provider: ^2.0.15
  printing: ^5.10.4
Step 2: Import Required Packages
dart
نسخ الكود
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
Step 3: Code for Generating PDF File
dart
نسخ الكود
Future<void> generatePdf() async {
  final pdf = pw.Document();

  // Add content to the PDF
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          pw.Text('Invoice Report', style: pw.TextStyle(fontSize: 24)),
          pw.SizedBox(height: 20),
          pw.Table.fromTextArray(
            headers: ['ID', 'Name', 'Amount'],
            data: [
              [1, 'John Doe', '\$100'],
              [2, 'Jane Smith', '\$200'],
              [3, 'Mike Brown', '\$150']
            ],
          ),
          pw.SizedBox(height: 20),
          pw.Text('Thank you for your business!', style: pw.TextStyle(fontSize: 16)),
        ],
      ),
    ),
  );

  // Save the PDF file
  final directory = await getApplicationDocumentsDirectory();
  final path = '${directory.path}/example.pdf';
  final file = File(path);
  await file.writeAsBytes(await pdf.save());

  print('PDF file saved at $path');
}
Step 4: Code for Previewing PDF File
dart
نسخ الكود
import 'package:printing/printing.dart';

class PDFPreview extends StatelessWidget {
  final String filePath;

  PDFPreview({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PDF Preview')),
      body: PdfPreview(
        build: (format) => File(filePath).readAsBytesSync(),
      ),
    );
  }
}
________________________________________
5. Key Features of PDF Operations
•	Customizable Content: PDFs allow precise customization, including text alignment, tables, images, and fonts.
•	Printing Support: The printing package enables easy integration with printers for hard-copy outputs.
•	Export and Sharing: Generated PDF files can be easily exported and shared across platforms.
________________________________________
Comparison: Excel vs PDF in Flutter
Feature	Excel	PDF
Primary Use	Data storage and calculations.	Printable reports, forms, and invoices.
Editable	Yes, editable with Excel tools.	No, maintains fixed formatting.
Custom Layout	Limited layout customization.	Highly customizable layouts.
Use Cases	Logs, tables, and analysis.	Reports, presentations, and receipts.
________________________________________
Conclusion
This session introduces Excel and PDF integration in Flutter to handle structured data and generate reports. These features empower developers to create professional applications that cater to real-world scenarios like generating invoices, exporting logs, and sharing reports.
Flutter’s flexibility with external file handling makes it a powerful framework for business and productivity applications.
