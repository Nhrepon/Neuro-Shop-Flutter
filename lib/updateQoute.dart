import 'dart:convert';

import 'package:assignment/model/quote.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Updateqoute extends StatefulWidget {
  const Updateqoute({super.key, required this.quote});
  static const String name = "update";
  final Quote quote;

  @override
  State<Updateqoute> createState() => _AddqouteState();
}

class _AddqouteState extends State<Updateqoute> {
  final TextEditingController title = TextEditingController();
  final TextEditingController author = TextEditingController();
  final TextEditingController img = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool progressbar = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title.text=widget.quote.title ?? "";
    author.text=widget.quote.subtitle ?? "";
    img.text=widget.quote.image ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Updateqoute.name),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16),
        child: qouteForm(),

        ),
      ),
    );
  }

  Widget qouteForm() {
    return Form(
      key: formKey,
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const SizedBox(height: 20,),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: title,
                decoration: InputDecoration(
                  hintText: 'Enter a Title',
                  hintStyle: const TextStyle(
                    color: Colors.green,
                    fontSize: 18
                  ),
                  hintMaxLines: 1,
                  labelText: 'Title *',
                  labelStyle: const TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter a valid title';
                  }
                  return null;
                },
              ),

              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: author,
                decoration: InputDecoration(
                  hintText: 'Enter an author name',
                  hintStyle: const TextStyle(
                      color: Colors.green,
                      fontSize: 18
                  ),
                  hintMaxLines: 1,
                  labelText: 'Author *',
                  labelStyle: const TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter a valid title';
                  }
                  return null;
                },
              ),

              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: img,
                decoration: InputDecoration(
                  hintText: 'Enter a image link',
                  hintStyle: const TextStyle(
                      color: Colors.green,
                      fontSize: 18
                  ),
                  hintMaxLines: 1,
                  labelText: 'Image *',
                  labelStyle: const TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter a valid title';
                  }
                  return null;
                },
              ),


              //const SizedBox(height: 20,),
              Visibility(
                visible: progressbar == false,
                replacement: Center(
                  child: CircularProgressIndicator(),
                ),
                child: ElevatedButton(
                  style: const ButtonStyle(

                  ),
                    onPressed: (){
                    if(formKey.currentState!.validate()){
                      updateQuote();
                    }
                    },
                    child: const Text("Update Qoute", style: TextStyle(
                      fontSize: 18,

                    ),)
                ),
              )
            ],
          ),
      //.childrenPadding(const EdgeInsets.only(bottom: 24)),
        );
  }



  Future<void> updateQuote()async{
    progressbar = true;
    setState(() {});
    Uri uri = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.quote.id}");
    Map<String, dynamic> reqBody = {
      "ProductName": title.text.trim(),
      "ProductCode": author.text.trim(),
      "Img": img.text.trim(),
      "UnitPrice": "11",
      "Qty": "11",
      "TotalPrice": "11",
    };
    Response response = await post(
        uri,
        headers: {
          'content-type':'application/json'
        },
        body: jsonEncode(reqBody));


    setState(() {});
    progressbar = false;

    if(response.statusCode == 200 ){
      clearText();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success!")));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed!")));
    }
  }

  void clearText(){
    title.clear();
    author.clear();
    img.clear();
  }



}

