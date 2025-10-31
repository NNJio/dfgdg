import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help/shared/componets/label.dart';
import 'package:help/shared/componets/space.dart';
import 'package:help/shared/utils/constants/enums.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Label(
            'ประวัติงาน',
            styleKey: StyleKey.headline5,
          ),
          addVerticalSpace(12.h),
          const Label(
            'แสดงรายการงานในอดีต',
            styleKey: StyleKey.bodyText2,
          ),
        ],
      ),
    );
  }
}
