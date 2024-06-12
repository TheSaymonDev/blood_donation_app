import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BloodSeeker extends StatelessWidget {

   const BloodSeeker({super.key});



  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => Container(
              height: 100,
              color: Colors.yellow,
            ),
        separatorBuilder: (context, index) => const Gap(8),
        itemCount: 20);
  }
}
