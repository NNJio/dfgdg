import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _socialButton(
          iconAsset: 'assets/icons/google_logo_icon.png',
          color: Colors.grey.shade200,
          onPressed: () {},
        ),
        _socialButton(
          iconAsset: 'assets/icons/facebook_logo_icon.png',
          color: Colors.grey.shade200,
          onPressed: () {},
        ),
        _socialButton(
          iconAsset: 'assets/icons/line_logo_icon.png',
          color: Colors.grey.shade200,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _socialButton({
    IconData? icon,
    String? iconAsset,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60.w,
        height: 60.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: icon != null
              ? Icon(icon, color: Colors.white, size: 28.sp)
              : Image.asset(
                  iconAsset!,
                  width: 28.w,
                  height: 28.w,
                ),
        ),
      ),
    );
  }
}
