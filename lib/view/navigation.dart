import 'package:flutter/material.dart';
import 'package:social_media_app/view/account.dart';
import 'package:social_media_app/view/home.dart';
import 'package:social_media_app/view/search.dart';
import 'package:social_media_app/view/videos.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: MediaQuery.of(context).size.height * 0.1,
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: <Widget>[
          const NavigationDestination(
            selectedIcon: Icon(IconsaxPlusBold.home),
            icon: Icon(IconsaxPlusLinear.home),
            label: 'Home',
          ),
          const NavigationDestination(
            selectedIcon: const Icon(IconsaxPlusBold.video),
            icon: Icon(IconsaxPlusLinear.video),
            label: 'Videos',
          ),
          NavigationDestination(
            enabled: false,
            icon: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.all(0),
                fixedSize: Size(MediaQuery.of(context).size.width * 0.06,
                    MediaQuery.of(context).size.height * 0.06),
                shape: const CircleBorder(),
              ),
              onPressed: () {},
              child: const Icon(IconsaxPlusLinear.add),
            ),
            label: '',
          ),
          const NavigationDestination(
            selectedIcon: Icon(IconsaxPlusBold.search_status),
            icon: Icon(IconsaxPlusLinear.search_normal),
            label: 'Search',
          ),
          const NavigationDestination(
            selectedIcon: Icon(IconsaxPlusBold.user),
            icon: Icon(IconsaxPlusLinear.profile),
            label: 'Account',
          ),
        ],
      ),
      body: [
        const Home(),
        const Videos(),
        const Center(),
        const Search(),
        const Account(),
      ][currentPageIndex],
    );
  }
}
