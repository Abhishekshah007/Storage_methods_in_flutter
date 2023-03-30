import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Storage',
      home: HomePage(),
    );
  }

}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}): super(key:key);

  @override
  State<StatefulWidget> createState() {
   return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  String? _data;

  Future<void> _loadData() async{
    final loadedData = await rootBundle.loadString('assets/files/data.txt');
    setState(() {
      _data =loadedData;
    });
  }
  @override
  Widget build(BuildContext context) {
 return Scaffold(
   appBar: AppBar(title: const Text('Fetch local Data'),),
   body: Center(
     child: SizedBox(
       width: 300,
       child: Text(_data ?? 'Nothing to show', style: const TextStyle(fontSize: 24),),
     ),

   ),
   floatingActionButton: FloatingActionButton(
     onPressed: _loadData, child: const Icon(Icons.add),
   ),
 );

  }
}