import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help/shared/componets/label.dart';
import 'package:help/shared/componets/space.dart';
import 'package:help/shared/utils/constants/enums.dart';
import '../../select_role/provider/role_provider.dart';
import 'package:help/feature/history/view/history.dart';
import 'package:help/feature/profile/view/profile.dart';
import 'package:help/shared/componets/scaffold_customs.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isHero = ref.watch(roleProvider);
    final role = isHero == true ? 'Hero' : 'User';

    Widget body;
    switch (_currentIndex) {
      case 0:
        body = Center(
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
        );
        break;
      case 1:
        body = const HistoryPage();
        break;
      case 2:
        body = const ProfilePage();
        break;
      default:
        body = const SizedBox.shrink();
    }

    return ScaffoldCustoms(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
