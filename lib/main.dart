import 'package:amad/PdfPreviewPage.dart';
import 'package:amad/pdfiles.dart';
import 'package:flutter/material.dart';



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
  int _counter = 0;
  Textfiles fileobj = Textfiles();
  final TextEditingController bookName = TextEditingController();
  final TextEditingController author = TextEditingController();
  final TextEditingController price = TextEditingController();

  String text = "Your text to display below image";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sales Bill"),),
      body: Column(
        children: [
          Image.asset("assets/phone.png"),
          TextFormField(
            controller: bookName,
            decoration: InputDecoration(
              labelText: 'Book Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: author,
            decoration: InputDecoration(
              labelText: 'Author',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: price,
            decoration: InputDecoration(
              labelText: 'Price',
              border: OutlineInputBorder(),
             // keyboardType: TextInputType.number,
            ),
          ),
          Text(text),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final bookDetails = [
            bookName.text,
            author.text,
            price.text,
          ];
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return  PdfPreviewPage(bookDetails);
          }));
        },
        child: const Icon(Icons.picture_as_pdf_sharp),
      ),
    );
  }
  }

