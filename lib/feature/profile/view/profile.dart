import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help/shared/utils/provider/provider.dart';
import 'package:help/feature/splash/view/splash.dart';
import 'package:help/feature/profile/view/profile_detail.dart';
import 'package:help/shared/componets/push_page.dart';

import 'package:help/shared/utils/constants/icon_text.dart';
import 'package:help/shared/componets/label.dart';
import 'package:help/shared/componets/space.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roleHero = ref.watch(roleProvider);
    bool isHero = roleHero == true;

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.w, 50.h, 10.w, 50.h),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 32.r,
                        backgroundImage: const NetworkImage(
                          'https://i.imgur.com/BoN9kdC.png', // เปลี่ยนเป็นรูปจริงของคุณ
                        ),
                      ),
                      addHorizontalSpace(16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Label('Sabrina Aryan', fontSize: 20.sp, fontWeight: FontWeight.bold),
                          Label('สถานะสมาชิก : ${isHero ? 'Hero' : 'User'}', fontSize: 14.sp, color: Colors.black54),
                          isHero
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    5,
                                    (index) => Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                                      child: const Icon(Icons.star, color: Colors.amber),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(24.h),
                buildMenuItem(
                  icon: Icons.account_circle_outlined,
                  title: 'ข้อมูลส่วนตัว',
                  onTap: () => go(context, const ProfileDetailPage()),
                ),
                isHero ? buildMenuItem(icon: Icons.paid_outlined, title: 'รายได้ของฉัน') : const SizedBox.shrink(),
                isHero ? buildMenuItem(icon: Icons.workspace_premium_outlined, title: 'สมัครรับการเป็น Hero') : const SizedBox.shrink(),
                buildMenuItem(icon: Icons.settings_outlined, title: 'การตั้งค่า'),
                buildMenuItem(icon: Icons.language, title: 'ภาษา'),
                buildMenuItem(icon: Icons.help_center_outlined, title: 'ศูนย์ความทนช่วยเหลือ'),
                buildMenuItem(icon: Icons.article_outlined, title: 'นโยบายความเป็นส่วนตัว'),
                Divider(thickness: 1, height: 32.h),
                buildMenuItem(
                  icon: Icons.logout,
                  title: 'ออกจากระบบ',
                  onTap: () {
                    ref.read(roleProvider.notifier).state = null;
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const SplashPage()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
