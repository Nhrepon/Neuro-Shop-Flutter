import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:neuro_shop/app/app_colors.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int _selectedSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              aspectRatio: 16/9,
              viewportFraction: 0.9,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInOut,
              onPageChanged: (index, reason){
                _selectedSlider = index;
                setState(() {});
              }
          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 3.0),
                    decoration: BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(
                      child: Text('text $i', style: TextStyle(fontSize: 16.0,),),
                    )
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(int i = 0; i < 5; i++)
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
        )
      ],
    );
  }
}
