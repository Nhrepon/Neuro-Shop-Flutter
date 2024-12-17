
import 'package:assignment/addQoute.dart';
import 'package:assignment/model/quote.dart';
import 'package:assignment/quoteList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'updateQoute.dart';

void main(){
  runApp(const Assignment());
}

class Assignment extends StatelessWidget {
  const Assignment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter CRUD application",
      home: Home(),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings setting){
        late Widget widget;
        if(setting.name == Addqoute.name){
          widget = const Addqoute();
        }else if(setting.name == Updateqoute.name){
          final Quote quote = setting.arguments as Quote;
          widget = Updateqoute(quote: quote);
        }
        return MaterialPageRoute(builder: (context){
          return widget;
        },);
      },

    );
  }
}


class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter CRUD application"),
        backgroundColor: Colors.yellow,
        actions: [
          IconButton(onPressed: ()=>{
            Navigator.pushNamed(context, Addqoute.name)
          }, icon: Icon(CupertinoIcons.add)),
          IconButton(onPressed: ()=>{}, icon: Icon(CupertinoIcons.settings_solid)),
          IconButton(onPressed: ()=>{}, icon: Icon(CupertinoIcons.phone)),
        ],
      ),

      body: const Quotelist(),


    );
  }
}

