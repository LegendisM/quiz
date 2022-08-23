import 'package:flutter/material.dart';
import 'package:quiz/home/services/document_service.dart';
import 'package:quiz/home/screens/form.dart';
import 'package:quiz/home/screens/settings.dart';
import 'package:quiz/home/screens/about.dart';

class Home extends StatefulWidget {
  Home({super.key});

  final DocumentService documentService = DocumentService();

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  late int currentTabIndex = 0;
  late List<Widget> tabs = [
    FormScreen(documentService: widget.documentService),
    const SettingScreen(),
    const AboutScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: tabs[currentTabIndex],
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
      ),
    );
  }
}
