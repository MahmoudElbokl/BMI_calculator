import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/home_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: { ResultScreen.routeName : (c){
        return ResultScreen();
      }, },
      title: "BMICalculator",
      color: Colors.blueGrey.shade900,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: HomePage(),
    );
  }
}
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  int x ;
//  List<String> mds = ["ahmed","Modamed","Mahmoud"];
//  TextEditingController _textEditingController = TextEditingController();
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(appBar: AppBar(title: Text("Random Teams"),),
//        floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
//          x = Random().nextInt(mds.length);
//          setState(() {
//            mds.removeAt(x);
//          });
//        }),
//        body: Container(
//          height: MediaQuery.of(context).size.height * 0.5,
//          child: Column(
//            children: <Widget>[
//              TextFormField(
//                controller: _textEditingController,
//              ),
//              RaisedButton(onPressed: (){
//                setState(() {
//                  mds.add(_textEditingController.text);
//                });
//              }),
//              Expanded(
//                child: ListView.builder(itemCount: mds.length,itemBuilder: (context , index){
//                  return ListTile(
//                    leading: CircleAvatar(child: Text("${index+1}"),),
//                    title: Text(mds[index]),
//                  );
//                }),
//              ),
//            ],
//          )
//        ),
//      ),
//    );
//  }
//}
//
