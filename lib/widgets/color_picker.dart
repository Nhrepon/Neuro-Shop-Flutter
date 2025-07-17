import 'package:flutter/material.dart';
import 'package:neuro_shop/app/app_colors.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onChange});

  final List<String> colors;
  final Function(String) onChange;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text("Colors", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
        SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.colors.length,
            itemBuilder: (context, index) {
              String color = widget.colors[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = color;
                  });
                  widget.onChange(selectedColor!);
                  print(selectedColor);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                    color: selectedColor == color ? AppColors.themeColor : null,
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 8),
                  child: Text(color, style: TextStyle(
                    color: selectedColor == color ? Colors.white:null,
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
