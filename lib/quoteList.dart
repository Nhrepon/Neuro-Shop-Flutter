import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Quotelist extends StatefulWidget {
  const Quotelist({super.key});

  @override
  State<Quotelist> createState() => _QuotelistState();
}

class _QuotelistState extends State<Quotelist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: 5, itemBuilder: (context, index){
        return Padding(
          padding: EdgeInsets.all(12),
          child: ListTile(
            leading: Text("Image"),
            title: Text("Title for Flutter CRUD application $index"),
            subtitle: Text("Authore"),
            trailing: Text("action icon"),
          ),
        );
      }),
    );
  }
}



