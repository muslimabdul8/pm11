import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/application_color.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: ChangeNotifierProvider<Applicationcolor>(
        builder: (context) => Applicationcolor(),
              child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Consumer<Applicationcolor>(
                          builder: (context,applicationColor, _) => Text(
                "Provider State Management", 
                style: TextStyle(color: applicationColor.color),
          ),
            ),
          ),
          body: Center(
            child: Column(
             mainAxisAlignment: MainAxisAlignment .center,
             children: <Widget>[
               Consumer<Applicationcolor>(
                                builder: (context, applicationColor, _) => AnimatedContainer(
                   margin: EdgeInsets.all(5),
                   width: 100,
                   height: 100,
                   color: applicationColor.color,
                   duration: Duration(microseconds: 500),
                 ),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Container(margin: EdgeInsets.all(5),child: Text("AB")),
                   Consumer<Applicationcolor>(
                                        builder: (context, applicationColor, _) => Switch(
                       value: applicationColor.isLightBlue, 
                       onChanged: (newValue) {
                         applicationColor.isLightBlue = newValue;
                       },
                       ),
                   ),
                   Container(margin: EdgeInsets.all(5),child: Text("LB"))
                 ],
               )
             ],
          ),
        ),
        ),
      ),
    );
  }
}