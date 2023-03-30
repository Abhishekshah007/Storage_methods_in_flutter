import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: "Read and Write Storage",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget{
  const HomePage({super.key});


  @override
  State<StatefulWidget> createState(){

    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{
 String? _content;

 Future<String> _getDirPath() async{
   final dir = await getApplicationDocumentsDirectory();
   return dir.path;
 }


 Future<void> _readData() async{
   final dirPath = await _getDirPath();
   final myFile = File('$dirPath/data.txt');
   final data = await myFile.readAsString(encoding: utf8);

   setState(() {
     _content = data;
   });
 }

 final _textController = TextEditingController();

 Future<void> _writeData() async{
   final _dirPath = await _getDirPath();
   final _myFile =  File('$_dirPath/data.txt');

   await _myFile.writeAsString(_textController.text);
   _textController.clear();
 }



 @override
  Widget build(BuildContext context){
   return Scaffold(
     appBar: AppBar(title: const Text('Read and Write Dynamic'),),

     body: Padding(
       padding: const EdgeInsets.all(20),
       child: Column(
         children: [
           TextField(
             controller: _textController,
             decoration: const InputDecoration(
               labelText: 'Enter Your Name:'
             ),
           ),
           ElevatedButton(onPressed: _writeData, child: const Text('Save to file')),
           const SizedBox(
             height: 100,
           ),

           Text(_content ?? 'press the button to load the data from file', style: const TextStyle(fontSize: 24,color:Colors.deepOrange),),
           ElevatedButton(onPressed: _readData, child: const Text('Read stored file'))
         ],
       ),
     ),
   );
 }

}













