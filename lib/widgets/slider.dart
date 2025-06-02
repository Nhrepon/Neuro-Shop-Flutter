import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_shop/app/app_colors.dart';
import 'package:neuro_shop/controller/slider_controller.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int _selectedSlider = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderController>(
      builder: (controller) {
        return Visibility(
          visible: controller.progress == false,
          replacement: Center(child: CircularProgressIndicator(),),
          child: Visibility(
            visible: controller.sliders.isNotEmpty,
            child: Column(
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
                  items: controller.sliders.map((slider) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 3.0),
                            decoration: BoxDecoration(
                                color: AppColors.themeColor,
                                borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(image: NetworkImage(slider.photoUrl,), fit: BoxFit.cover),

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  color: Colors.black,
                                  child: Text(slider.description, style: TextStyle(fontSize: 16.0,color: Colors.white),),
                                    )
                              ],
                            )
                        );
                      },
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i = 0; i < controller.sliders.length; i++)
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
            ),
          ),
        );
      }
    );
  }
}
