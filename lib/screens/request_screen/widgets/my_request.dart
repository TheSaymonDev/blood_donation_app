import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyRequest extends StatelessWidget {

   const MyRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => Container(
          height: 100,
          color: Colors.green,
        ),
        separatorBuilder: (context, index) => Gap(8),
        itemCount: 20);
  }
}
