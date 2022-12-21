import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../resoursec/app_style.dart';
import '../resoursec/app_text.dart';
import '../resoursec/assets_manager.dart';

class BuildCartEmpty extends StatelessWidget {
  const BuildCartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImagesAssets.emptyCart),
            SizedBox(
              height: 10.h,
            ),
            Text(
              AppText.cartEmptyDesc,
              textAlign: TextAlign.center,
              style: getDescriptionGreyStyle(),
            )
          ],
        ),
      ),
    );
  }
}
