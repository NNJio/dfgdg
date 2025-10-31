import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:help/shared/utils/provider/provider.dart';

class ScaffoldCustoms extends ConsumerWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? overlayColor; // เผื่อเปลี่ยนสีทับไล่สีบางกรณี

  const ScaffoldCustoms({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.drawer,
    this.endDrawer,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHero = ref.watch(roleProvider);

    final Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: isHero == true
          ? [
              Colors.blueAccent.shade200,
              Colors.blueAccent.shade100,
              Colors.grey.shade200,
            ]
          : [
              Colors.blueGrey.shade300,
              Colors.blueGrey.shade100,
              Colors.grey.shade200,
            ],
    );

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: ColoredBox(
        color: (overlayColor ?? Colors.transparent),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          drawer: drawer,
          endDrawer: endDrawer,
        ),
      ),
    );
  }
}
