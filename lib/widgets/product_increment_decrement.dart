import 'package:flutter/material.dart';
import 'package:neuro_shop/app/app_colors.dart';

class ProductIncrementDecrement extends StatefulWidget {
  const ProductIncrementDecrement({super.key, required this.onChange});
  final Function(int) onChange;
  @override
  State<ProductIncrementDecrement> createState() => _ProductIncrementDecrementState();
}

class _ProductIncrementDecrementState extends State<ProductIncrementDecrement> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      children: [
        GestureDetector(
          onTap: (){
            if(count > 1){
              count--;
              widget.onChange(count);
              setState(() {});
            }
          },
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(4)
            ),
            child: Icon(Icons.remove, color: Colors.white,),
          ),
        ),
        Text("$count", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
        GestureDetector(
          onTap: (){
            if(count < 100){
              count++;
              widget.onChange(count);
              setState(() {});
            }
          },
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.circular(4)
            ),
            child: Icon(Icons.add, color: Colors.white,),
          ),
        ),
      ],
    );
  }
}
