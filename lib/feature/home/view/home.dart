import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:help/feature/history/view/history.dart';
import 'package:help/feature/profile/view/profile.dart';
import 'package:help/feature/nearby_jobs/view/nearby_jobs.dart';
import 'package:help/shared/componets/label.dart';
import 'package:help/shared/componets/space.dart';
import 'package:help/shared/componets/scaffold_customs.dart';
import 'package:help/shared/utils/constants/enums.dart';
import 'package:help/shared/utils/provider/provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final roleHero = ref.watch(roleProvider);
    final isHero = roleHero == true;
    final role = isHero ? 'Hero' : 'User';

    // ✅ สร้างรายการหน้าแบบ dynamic
    final pages = <Widget>[
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Label(
              'ยินดีต้อนรับ $role',
              styleKey: StyleKey.headline5,
            ),
            addVerticalSpace(12.h),
            const Label(
              'ล็อกอินสำเร็จด้วย OTP',
              styleKey: StyleKey.bodyText2,
            ),
          ],
        ),
      ),
      const HistoryPage(),
      if (isHero) const NearbyJobsPage(),
      const ProfilePage(),
    ];

    // ✅ สร้าง BottomNavigationBarItem ให้ตรงกัน
    final navItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      const BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
      if (isHero) const BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ''),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
    ];

    // ✅ ป้องกัน index เกิน (เช่น toggle role ไปมา)
    final safeIndex = _currentIndex >= pages.length ? 0 : _currentIndex;

    return ScaffoldCustoms(
      body: pages[safeIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: safeIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: navItems,
      ),
    );
  }
}
