import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:help/feature/login/view/login.dart';

import '../../../shared/componets/role_card.dart';
import '../provider/role_provider.dart';

class SelectRolePage extends ConsumerWidget {
  const SelectRolePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void selectRole(bool isHero) {
      ref.read(roleProvider.notifier).state = isHero;
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'โปรดเลือกระหว่าง',
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                roleCard(
                  title: 'User',
                  color: Colors.blueGrey,
                  onTap: () => selectRole(false),
                ),
                roleCard(
                  title: 'Hero',
                  color: Colors.blueAccent,
                  onTap: () => selectRole(true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
