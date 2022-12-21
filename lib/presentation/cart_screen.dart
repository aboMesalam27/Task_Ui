import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_test_ui_sudi/resoursec/colors.dart';
import 'package:task_test_ui_sudi/controller/cart_controller.dart';

import '../resoursec/app_style.dart';
import '../resoursec/app_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _cIndex = 0;
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 34.h,
                width: 123.w,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.r),
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(10.r),
                    topLeft: Radius.circular(30.r),
                  )),
                  color: redAccent,
                  child: Row(
                    children: [
                      Icon(Icons.add_location, color: white),
                      SizedBox(
                        width: 7.w,
                      ),
                      Text(
                        AppText.mustafa,
                        style:
                            getRegularStyle(color: white, letterSpacing: 0),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 34.w,
                height: 34.h,
                decoration: ShapeDecoration(
                    color: white,
                    shape: CircleBorder(
                        side: BorderSide(width: 1.5.w, color: grey))),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 13.0.w),
          child: Text(
            'Cart',
            style: getBoldStyle(color: black, fontSize: 15.sp),
          ),
        ),

        Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.w,
                      child: Card(
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Turkish Steak',
                          style:
                              getRegularStyle(color: black, letterSpacing: 0),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          '173 Grams',
                          style: getDescriptionGreyStyle(),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          '\$ 25',
                          style: getBoldStyle(color: red),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Card(

                            color: Colors.blue.shade200,
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(Icons.remove,color: Colors.blue.shade500,),
                            ),
                          ),
                          SizedBox(width: 10.w,),
                          Text('12'),
                          SizedBox(width: 10.w,),


                           Card(
                            color: Colors.blue.shade200,
                            // ignore: prefer_const_constructors
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(Icons.add,color: Colors.blue.shade500),
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                );
              },
              itemCount: 15,
              separatorBuilder: (context, index) => Divider(
                thickness: 2,
                color: grey.withOpacity(0.3),
              ),
            ),
          ),
        )
      ],
    );
  }
}
// subTotal() {
//     return getData()
//             .map((e) => (e.price)! * (e.quantity as int))
//             .reduce((value, element) => value + element)
//             .toStringAsFixed(2);
//   }
