import 'package:assignment/model/quote.dart';
import 'package:assignment/updateQoute.dart';
import 'package:flutter/material.dart';

class QuoteItem extends StatelessWidget {
  const QuoteItem ({super.key, required this.quote});

  final Quote quote;

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
            IconButton(onPressed: (){Navigator.pushNamed(context, Updateqoute.name, arguments: quote);}, icon: Icon(Icons.edit, size: 16,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.delete, size: 16,)),
          ],
        ),
      ),
    );;
  }
}
