import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ordo_test/core/helper/colors.dart';
import 'package:ordo_test/core/helper/icon.dart';
import 'package:ordo_test/core/helper/images.dart';
import 'package:ordo_test/core/helper/textstyle.dart';
import 'package:ordo_test/feature/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:ordo_test/feature/dashboard/presentation/pages/dashboard.dart';

void main() {
  runApp(ORDOTEST());
}

class ORDOTEST extends StatelessWidget {
  const ORDOTEST({super.key});

  @override
  Widget build(BuildContext context) {
    return InitialApp();
  }
}

class OrdoTestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MainApp(),
      initialBinding: OrdoTestBinding(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int selectedIndex = 0;
  List<Widget> _widget = [];
  @override
  void initState() {
    _widget = [
      Dashboard(),
      Dashboard(),
      Dashboard(),
      Dashboard(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widget.elementAt(selectedIndex),
      bottomNavigationBar: SizedBox(
        height: 93,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (val) {},
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: smalltextStyleWhite,
              unselectedLabelStyle: smalltextStyleWhite,
              selectedItemColor: whiteColor,
              unselectedItemColor: whiteColor.withOpacity(.7),
              backgroundColor: primaryColor,
              items: _item),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _item = [
    BottomNavigationBarItem(icon: icon.svg(home), label: 'Home'),
    BottomNavigationBarItem(icon: icon.svg(notepad), label: 'Lead'),
    BottomNavigationBarItem(icon: icon.svg(clockCircle), label: 'Commission'),
    BottomNavigationBarItem(icon: icon.svg(user), label: 'Commission'),
  ];
}
