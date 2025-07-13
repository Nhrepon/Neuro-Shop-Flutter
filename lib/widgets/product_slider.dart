import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:neuro_shop/app/app_colors.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({super.key, required this.imageList});
  final List<String> imageList;

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  int _selectedSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              aspectRatio: 16/9,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInOut,
              onPageChanged: (index, reason){
                _selectedSlider = index;
                setState(() {});
              }
          ),
          items: widget.imageList.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Image.network(image,fit: BoxFit.cover,);
                // return Container(
                //     width: MediaQuery.of(context).size.width,
                //     color: Colors.grey.shade200,
                //     child: Center(
                //       child: Text('Image $i', style: TextStyle(fontSize: 16.0,),),
                //     )
                // );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i = 0; i < widget.imageList.length; i++)
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: _selectedSlider == i ? AppColors.themeColor:Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 3, vertical: 8),
                )

            ],
          ),
        )
      ],
    );
  }
}
