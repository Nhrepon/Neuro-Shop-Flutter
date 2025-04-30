import 'package:flutter/material.dart';
import 'package:neuro_shop/app/app_colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onChange});

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text("Sizes", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
        SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.sizes.length,
            itemBuilder: (context, index) {
              String size = widget.sizes[index];
              return GestureDetector(
                onTap: () {
                  selectedSize = size;
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                    color: selectedSize == size ? AppColors.themeColor : null,
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 8),
                  child: Text(size, style: TextStyle(
                    color: selectedSize == size ? Colors.white:null,
                    fontWeight: FontWeight.w600
                  ),),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
