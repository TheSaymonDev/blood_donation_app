import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/widgets/custom_elevated_button.dart';
import 'package:free_blood_donation/widgets/custom_text_form_field.dart';
import 'package:gap/gap.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: double.infinity.h,
      width: double.infinity.w,
      child: Column(
        children: [
          Text('Feed Screen'),
          CustomElevatedButton(onPressed: (){}, name: 'Sign In'),
          Gap(20),
          CustomTextFormField(hintText: 'Enter your name', controller: _controller)
        ],
      ),
    );
  }
}
