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
            children: [
              TextFormField(
                controller: title,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  labelText: 'Title'
                ),
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter a valid title';
                  }
                },
              ),
              TextFormField(),
              TextFormField(),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){},
                  child: const Text("Add Qoute")
              )
            ],
          ),
        );
  }
}
