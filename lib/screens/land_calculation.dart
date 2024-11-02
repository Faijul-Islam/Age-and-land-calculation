import 'package:age_and_land_calculation/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/colors.dart';
import '../widgets/commn_textfield.dart';
import '../widgets/common_button.dart';
import '../widgets/common_card.dart';

class LandCalculation extends StatefulWidget {
  const LandCalculation({Key? key}) : super(key: key);

  @override
  State<LandCalculation> createState() => _LandCalculationState();
}

class _LandCalculationState extends State<LandCalculation> {
  double squareFoot = 0.0, percentage = 0.0,
      wood = 0.0,
      acre = 0.0;

  final  right=TextEditingController();
  final  left=TextEditingController();
  final  top=TextEditingController();
  final  bottom=TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryBlue,
        centerTitle: true,
        title:  Text("Land Calculation Screen",
        style:CustomTextStyles.mediumText(18.sp,color: Colors.white),
        ),
      ),
      body: ListView(
        children:  [
          SizedBox(height: 30.h,),
          CommonCard(
              widget:Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text("  Right side fit and inch",
                            style: CustomTextStyles.mediumText(12.sp,color: Colors.black),
                          )
                      ),
                      SizedBox(width: 12.h,),
                      Expanded(
                        child: Expanded(
                            child: Text("  Left side fit and inch",
                              style: CustomTextStyles.mediumText(12.sp,color: Colors.black),
                            )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CommonTextField(
                          inputType: TextInputType.number,
                            controler: right,
                            hint: "right",
                            textAlign: TextAlign.start,
                            redOnly: false
                        ),
                      ),
                      SizedBox(width: 12.h,),
                      Expanded(
                        child: CommonTextField(
                            inputType: TextInputType.number,
                            controler: left,
                            hint: "left",
                            textAlign: TextAlign.start,
                            redOnly: false
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Expanded(
                          child: Text("   Top side fit and inch",
                            style: CustomTextStyles.mediumText(12.sp,color: Colors.black),
                          )
                      ),
                      SizedBox(width: 12.h,),
                      Expanded(
                        child: Expanded(
                            child: Text("   Bottom side fit and inch",
                              style: CustomTextStyles.mediumText(12.sp,color: Colors.black),
                            )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CommonTextField(
                            inputType: TextInputType.number,
                            controler: top,
                            hint: "top",
                            textAlign: TextAlign.start,
                            redOnly: false
                        ),
                      ),
                      SizedBox(width: 12.h,),
                      Expanded(
                        child: CommonTextField(
                            inputType: TextInputType.number,
                            controler: bottom,
                            hint: "bottom",
                            textAlign: TextAlign.start,
                            redOnly: false
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          SizedBox(height: 10.h,),
          CommonCard(
              widget:Column(
                children: [
                  Text("Rsult",
                    style: CustomTextStyles.mediumText(12.sp,color: Colors.black),
                  ),
                  Text("squareFoot: ${squareFoot.toStringAsFixed(2)}",
                    style: CustomTextStyles.mediumText(12.sp,color: Colors.black),
                  ),
                  Text("percentage: ${percentage.toStringAsFixed(2)}",
                    style: CustomTextStyles.mediumText(12.sp,color: Colors.black),
                  ),
                  Text("wood: ${wood.toStringAsFixed(2)}",
                    style: CustomTextStyles.mediumText(12.sp,color: Colors.black),
                  ),
                  Text("acre: ${acre.toStringAsFixed(2)}",
                    style: CustomTextStyles.mediumText(12.sp,color: Colors.black),
                  ),

                ],
              )),
          SizedBox(height: 10.h,),
          CommonButton(
              buttonText: "Calculate Land",
              onTap: (){
                double rightS = double.tryParse(right.text)!;
                double leftS = double.tryParse(left.text)!;
                double topS = double.tryParse(top.text)!;
                double bottomS = double.tryParse(bottom.text)!;
                double withs=rightS+leftS;
                double heights=bottomS+topS;
                double resultWith=withs/2;
                double resultHeight=heights/2;
                squareFoot=resultWith * resultHeight;
                percentage=squareFoot/435.6;
                wood=squareFoot/720;
                acre=squareFoot/43560;
                setState(() {

                });
              })
        ],
      ),
    );
  }

}
