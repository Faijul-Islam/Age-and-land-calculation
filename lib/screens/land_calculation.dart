import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/commn_textfield.dart';
import '../widgets/common_button.dart';
import '../widgets/common_card.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
      body: ListView(
        children:  [
          SizedBox(height: 30.h,),
          CommonCard(
              widget:Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CommonTextField(
                            controler: right,
                            hint: "right",
                            textAlign: TextAlign.start,
                            redOnly: false
                        ),
                      ),
                      SizedBox(width: 12.h,),
                      Expanded(
                        child: CommonTextField(
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
                        child: CommonTextField(
                            controler: top,
                            hint: "top",
                            textAlign: TextAlign.start,
                            redOnly: false
                        ),
                      ),
                      SizedBox(width: 12.h,),
                      Expanded(
                        child: CommonTextField(
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
          SizedBox(height: 30.h,),
          CommonCard(
              widget:Column(
                children: [
                  Text("Rsult"),
                  Text("squareFoot: ${squareFoot.toStringAsFixed(2)}"),
                  Text("percentage: ${percentage.toStringAsFixed(2)}"),
                  Text("wood: ${wood.toStringAsFixed(2)}"),
                  Text("acre: ${acre.toStringAsFixed(2)}"),

                ],
              )),
          SizedBox(height: 30.h,),
          CommonButton(
              buttonText: "Calculate",
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
