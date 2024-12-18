
import 'package:assignment/model/quote.dart';
import 'package:assignment/updateQoute.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class QuoteItem extends StatelessWidget {
  QuoteItem ({super.key, required this.quote, required this.onDelete});

  bool progressbar = false;
  final Quote quote;
  final VoidCallback onDelete;

  Future<void> deleteQuote()async{
    progressbar = true;
    Uri uri = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/${quote.id}");
    Response response = await get(uri);
    if(response.statusCode == 200){
      //print(response.body);
        Fluttertoast.showToast(msg: "Delete success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        onDelete();

    }
    progressbar = false;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: EdgeInsets.all(12),
      child: ListTile(

        leading: Image.network(quote.image ?? "",width: 80, errorBuilder: (context, error, stackTrace) { return Icon(Icons.error); },),
        title: Text(quote.title ?? "", maxLines: 1,),
        subtitle: Text(quote.subtitle ?? "", maxLines: 1,),
        trailing: Wrap(
          children: [
            IconButton(onPressed: (){Navigator.pushNamed(context, Updateqoute.name, arguments: quote);}, icon: const Icon(Icons.edit,)),
            IconButton(onPressed: ()async{await deleteQuote();}, icon: const Icon(Icons.delete,color: Colors.red,)),
          ],
        ),
      ),
    );;
  }




}
