import 'package:flutter/material.dart';
import 'package:quiz/home/screens/form.dart';
import 'package:quiz/home/screens/settings.dart';
import 'package:quiz/home/screens/about.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    const FormScreen(),
    const SettingScreen(),
    const AboutScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(13.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Theme.of(context).backgroundColor,
        ),
        child: BottomNavigationBar(
          currentIndex: currentTabIndex,
          items: const [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.home_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.settings,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.account_box_outlined,
              ),
            ),
          ],
          onTap: (index) => setState(
            () => currentTabIndex = index,
          ),
        ),
      ),
    );
  }
}
