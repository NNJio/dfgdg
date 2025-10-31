import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help/shared/utils/constants/provider.dart';
import 'package:help/shared/componets/scaffold_customs.dart';
import 'package:help/shared/componets/label.dart';
import 'package:help/shared/componets/space.dart';
import 'package:help/shared/utils/constants/enums.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(registerProvider);

    ref.listen(registerProvider, (prev, next) {
      if (next.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage!)),
        );
      }
    });

    return ScaffoldCustoms(
      appBar: AppBar(title: const Label('สมัครสมาชิก', styleKey: StyleKey.headline6)),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Label('ลงทะเบียน', fontSize: 28.sp, fontWeight: FontWeight.bold),
              addVerticalSpace(32.h),
              TextField(
                controller: vm.nameController,
                decoration: InputDecoration(
                  labelText: 'ชื่อ',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                ),
              ),
              addVerticalSpace(16.h),
              TextField(
                controller: vm.emailController,
                decoration: InputDecoration(
                  labelText: 'อีเมล',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                ),
              ),
              addVerticalSpace(16.h),
              TextField(
                controller: vm.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'รหัสผ่าน',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                ),
              ),
              addVerticalSpace(24.h),
              vm.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () => vm.register(),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48.h),
                      ),
                      child: const Label('สมัครสมาชิก', styleKey: StyleKey.button),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
