import 'package:flutter/material.dart';

class Addqoute extends StatefulWidget {
  const Addqoute({super.key});
  static const String name = "add-new";

  @override
  State<Addqoute> createState() => _AddqouteState();
}

class _AddqouteState extends State<Addqoute> {
  final TextEditingController title = TextEditingController();
  final TextEditingController author = TextEditingController();
  final TextEditingController img = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Addqoute.name),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const SizedBox(height: 20,),
              TextFormField(
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
              //const SizedBox(height: 20,),
              //const Spacer(),
              TextFormField(
                controller: author,
                decoration: const InputDecoration(
                  hintText: 'Enter a Title',
                  labelText: 'Title',
                  border: OutlineInputBorder(),

                ),
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter a valid title';
                  }
                },
              ),
              //const SizedBox(height: 20,),
              TextFormField(
                controller: img,
                decoration: const InputDecoration(
                  hintText: 'Enter a Title',
                  labelText: 'Title',
                  border: OutlineInputBorder(),

                ),
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter a valid title';
                  }
                },
              ),


              //const SizedBox(height: 20,),
              ElevatedButton(
                style: const ButtonStyle(

                ),
                  onPressed: (){},
                  child: const Text("Add Qoute", style: TextStyle(
                    fontSize: 18,

                  ),)
              )
            ],
          ).childrenPadding(const EdgeInsets.only(bottom: 24)),
        );
  }
}

extension WidgetExtension on Widget {
  Widget paddingAll(double value) => Padding(padding: EdgeInsets.all(value), child: this);

  Widget padding(EdgeInsets padding) => Padding(padding: padding, child: this);
}

extension ColumnExtension on Column {
  Column childrenPadding(EdgeInsets padding) {
    return Column(
      children: children.map((e) => e.padding(padding)).toList(),
    );
  }
}
