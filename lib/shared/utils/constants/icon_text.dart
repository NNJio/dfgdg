import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildMenuItem({
  required IconData icon,
  required String title,
  VoidCallback? onTap,
}) {
  return ListTile(
    leading: Icon(icon, size: 28.sp),
    title: Text(title, style: TextStyle(fontSize: 16.sp)),
    trailing: const Icon(Icons.chevron_right),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
    onTap: onTap,
  );
}
