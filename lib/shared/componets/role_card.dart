import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget roleCard({
  required String title,
  required Color color,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(16.r),
    child: Container(
      width: 140.w,
      height: 160.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 24.sp, color: Colors.white),
        ),
      ),
    ),
  );
}
