import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/Adhkar/screens/adhkar_screen.dart';
import 'package:sakina/features/Hadith/controllers/HadithCubit/hadith_cubit.dart';
import 'package:sakina/features/Hadith/repo/hadith_repositor.dart';
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

  final List<Widget> screens = const [
    QuranScreen(),
    HadithScreen(),
    AdhkarScreen(),
    PrayerTimeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,

      body: BlocProvider(
        create: (_) => HadithCubit(HadithRepository())..loadChapters(),
        child: IndexedStack(index: currentIndex, children: screens),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.secondaryColor.withOpacity(0.25),
            ),
            color: AppColors.backgroundScaffold,
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
                onTap: () => setState(() => currentIndex = 0),
              ),
              NavItem(
                index: 1,
                currentIndex: currentIndex,
                label: 'الأحاديث',
                icon: 'assets/images/hadith.svg',
                onTap: () => setState(() => currentIndex = 1),
              ),
              NavItem(
                index: 2,
                currentIndex: currentIndex,
                label: 'الأذكار',
                icon: 'assets/images/adhkar.svg',
                onTap: () => setState(() => currentIndex = 2),
              ),
              NavItem(
                index: 3,
                currentIndex: currentIndex,
                label: 'الأذان',
                icon: 'assets/images/prayer.svg',
                onTap: () => setState(() => currentIndex = 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
