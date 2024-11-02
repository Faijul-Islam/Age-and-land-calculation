
import 'package:age_and_land_calculation/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'age_calculation.dart';
import 'land_calculation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonButton(
              buttonText: "Land Page",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LandCalculation()));
              }),
          SizedBox(
            height: 10.h,
          ),
          CommonButton(
              buttonText: "Age Page",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AgeCalculation()));
              }),
        ],
      ),
    );
  }
}
