import 'package:flutter/material.dart';
import 'package:flutterfrontend/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Flutter with Laravel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Connect flutter with laravel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Student studentservice = Student();
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder<List>(
          future: studentservice.getAllStudent(),
          builder: (context, snapshot){
            print(snapshot.data);
            if(snapshot.hasData){
              return ListView.builder(itemCount: 3,itemBuilder: (context, i){
        return Card(
          child: ListTile(
            title: Text(
              'Name',
              style: TextStyle(fontSize: 30.0),
            ),
            subtitle: Text(
              'Email', style: TextStyle(fontSize: 30.0),
            ),
          ),
        );
      });
            }else{
              return const Center(
                child: Text('No Data Found'),
              );
            }
          },
        ),
      ),  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
