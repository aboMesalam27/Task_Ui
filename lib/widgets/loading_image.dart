

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_test_ui_sudi/resoursec/colors.dart';

class LoadingImageContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final bool repeat;

  const LoadingImageContainer({
    Key? key,
    required this.width,
    required this.height,
    this.repeat = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: white,
      highlightColor: grey.withOpacity(0.2),
      loop: repeat ? 0 : 1,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: grey.withOpacity(0.3),
        ),
      ),
    );
  }
}
