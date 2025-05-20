import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/core/helper/my_logger.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/features/home/data/models/sliders_response_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/helper/responsive.dart';
import '../../../../core/utils/app_colors.dart';
import '../../manager/home_cubit/home_cubit.dart';
import '../../manager/home_cubit/home_state.dart';

class MySlider extends StatelessWidget {
  const MySlider({super.key, required this.sliders, this.onSliderChanged});
  final List<SliderModel> sliders;
  final void Function(int index)? onSliderChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: ResponsiveHelper.h(context, height: 190),
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              onSliderChanged != null ? onSliderChanged!(index) : null;
            },
          ),
          items:
              sliders.map((slider) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,

                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: NetworkImage(slider.imagePath!),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              slider.title!,
                              textAlign: TextAlign.start,
                              style: AppTextStyles.f20w700(
                                context,
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              slider.title!,
                              textAlign: TextAlign.start,
                              style: AppTextStyles.f12w400(
                                context,
                                color: AppColors.white,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                  color: AppColors.white,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Shop Now',
                                    style: AppTextStyles.f14w600(
                                      context,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_right_alt_sharp,
                                    color: AppColors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
        ),
        SizedBox(height: ResponsiveHelper.h(context, height: 10)),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return AnimatedSmoothIndicator(
              activeIndex: HomeCubit.get(context).currentSliderIndex,
              count: sliders.length,
              effect: WormEffect(
                dotHeight: ResponsiveHelper.w(context, width: 10),
                dotWidth: ResponsiveHelper.w(context, width: 10),
                activeDotColor: AppColors.pink,
                dotColor: AppColors.lightGrey,
              ),
            );
          },
        ),
      ],
    );
  }
}
