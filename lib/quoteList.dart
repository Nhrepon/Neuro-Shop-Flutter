import 'dart:convert';

import 'package:assignment/model/quote.dart';
import 'package:assignment/widget/quoteItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Quotelist extends StatefulWidget {
  const Quotelist({super.key,});

  @override
  State<Quotelist> createState() => _QuotelistState();
}

class _QuotelistState extends State<Quotelist> {
  List<Quote> quoteList = [];
  bool progressbar = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuoteList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async { getQuoteList(); },
        child: Visibility(
          visible: progressbar == false,
          replacement: const Center(
        child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
              itemCount: quoteList.length,
              itemBuilder: (context, index){
            return QuoteItem(
              quote: quoteList[index],
            );
          }),
        ),
      ),
    );
  }

  Future<void> getQuoteList()async{
    quoteList.clear();
    progressbar = true;
    setState(() {});
    Uri uri = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
    Response response = await get(uri);
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      for(Map<String, dynamic> p in data['data']){
        Quote quote = Quote(
          id: p['_id'],
          title: p['ProductName'],
          subtitle: p['ProductCode'],
          image: p['Img'],
        );

        quoteList.add(quote);
        //final img = quote.image;
        //print("iamges: $img");
      }
      setState(() {});
    }
    progressbar = false;

  }
}



