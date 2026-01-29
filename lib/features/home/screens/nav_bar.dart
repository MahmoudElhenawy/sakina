import 'package:flutter/material.dart';
import 'package:sakina/features/Adhkar/screens/adhkar_screen.dart';
import 'package:sakina/features/Hadith/screens/hadith_screen.dart';
import 'package:sakina/features/Prayer _Times/screens/prayer_time_screen.dart';
import 'package:sakina/features/Quran/screens/quran_screen.dart';
import 'package:sakina/features/home/widgets/nav_item.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  final screens = [
    QuranScreen(),
    HadithScreen(),
    AdhkarScreen(),
    PrayerTimeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFF1C2A24),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              NavItem(
                index: 0,
                currentIndex: currentIndex,
                label: 'القرآن',
                icon: 'assets/images/quran.svg',

                onTap: () {
                  setState(() => currentIndex = 0);
                },
              ),
              NavItem(
                index: 1,
                currentIndex: currentIndex,
                label: 'الأحاديث',
                icon: 'assets/images/hadith.svg',
                onTap: () {
                  setState(() => currentIndex = 1);
                },
              ),
              NavItem(
                index: 2,
                currentIndex: currentIndex,
                label: 'الأذكار',
                icon: 'assets/images/adhkar.svg',
                onTap: () {
                  setState(() => currentIndex = 2);
                },
              ),
              NavItem(
                index: 3,
                currentIndex: currentIndex,
                label: 'الأذان',
                icon: 'assets/images/prayer.svg',
                onTap: () {
                  setState(() => currentIndex = 3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
