
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const Assignment());
}

class Assignment extends StatelessWidget {
  const Assignment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Assignment",
      home: Profile()
    );
  }
}


class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My profile"),
        backgroundColor: Colors.yellow,
        actions: [
          IconButton(onPressed: ()=>{}, icon: Icon(CupertinoIcons.add)),
          IconButton(onPressed: ()=>{}, icon: Icon(CupertinoIcons.settings)),
          IconButton(onPressed: ()=>{}, icon: Icon(CupertinoIcons.dial)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Image.asset('images/img1.jpg', width: 150,),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('Ice-creame is very delicious right?'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Image.asset('images/img1.jpg', width: 150,),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("Programming is not boring if you love it."),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Image.asset('images/img1.jpg', width: 150,),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('Ice-creame is very delicious right?'),
            ),


          ],
        ),
      ),
    );
  }
}

