import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help/feature/register/view/register.dart';
import 'package:help/feature/otp/view/otp.dart';
import 'package:help/shared/componets/label.dart';
import 'package:help/shared/componets/social_login_button.dart';
import 'package:help/shared/utils/constants/enums.dart';
import 'package:help/shared/componets/space.dart';
import 'package:help/shared/componets/scaffold_customs.dart';

import '../../select_role/provider/role_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHero = ref.watch(roleProvider);
    final role = isHero == true ? 'Hero' : 'User';

    return ScaffoldCustoms(
      appBar: AppBar(
        title: const Label(
          'กลับไปหน้าเลือกตำแหน่ง',
          styleKey: StyleKey.headline6,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              addVerticalSpace(32.h),
              Label(
                'ยินดีต้อนรับนะ $role !!',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
              addVerticalSpace(80.h),
              Label(
                'Create an account',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              addVerticalSpace(12.h),
              Label(
                'Enter your email to sign up for this app',
                fontSize: 16.sp,
              ),
              addVerticalSpace(20.h),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                  hintText: 'Email',
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                ),
              ),
              addVerticalSpace(24.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const OtpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48.h),
                ),
                child: const Label(
                  'Continue',
                  styleKey: StyleKey.button,
                ),
              ),
              addVerticalSpace(24.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      height: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Label(
                    'หรือ',
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      height: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              addVerticalSpace(24.h),
              const SocialLoginButtons(),
              addVerticalSpace(24.h),
              Label(
                'Don\'t have an account?',
                fontSize: 16.sp,
              ),
              addVerticalSpace(8.h),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const RegisterPage()),
                ),
                child: Label(
                  'Register',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
