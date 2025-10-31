import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EarningsSummary extends StatelessWidget {
  const EarningsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Text('วันนี้', style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                SizedBox(height: 4.h),
                Text('5,000 ฿', style: TextStyle(color: Colors.white, fontSize: 20.sp)),
                SizedBox(height: 16.h),
              ],
            ),
          ),
          Container(width: 1.w, height: 48.h, color: Colors.white),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Text('เดือนนี้', style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                SizedBox(height: 4.h),
                Text('70,000 ฿', style: TextStyle(color: Colors.white, fontSize: 20.sp)),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
