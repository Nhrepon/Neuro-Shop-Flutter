
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
          IconButton(onPressed: ()=>{}, icon: Icon(CupertinoIcons.settings_solid)),
          IconButton(onPressed: ()=>{}, icon: Icon(CupertinoIcons.phone)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black26,
              child: Image.asset('images/ice-cream.png', width: 100,),
              radius: 80,
            ),
            Text('Ice-creame is very delicious right?',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, height: 4)),



            CircleAvatar(
              backgroundColor: Colors.black26,
              child: Image.asset('images/code.png', width: 100,),
              radius: 80,
            ),
            Text('Programming is not boring if you love it.',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, height: 4)),



            CircleAvatar(
              backgroundColor: Colors.black26,
              child: Image.asset('images/blood.png', width: 100,),
              radius: 80,
            ),
            Text('If you submit code directly copy from chatgpt then mark will be 0',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),


          ],
        ),
      ),
    );
  }
}

