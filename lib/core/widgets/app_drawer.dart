import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/core/widgets/custom_app_bar.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundScaffold,
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomAppBar(showMenu: false),

          const SizedBox(height: 16),

          _drawerItem('assets/images/tasbih.svg', 'السبحة الإلكترونية'),
          _drawerItem('assets/images/qbla.svg', ' القبلة'),
          _drawerItem('assets/images/werd.svg', 'الورد اليومي'),

          // _drawerItem('assets/images/settings.svg', 'الإعدادات'),
        ],
      ),
    );
  }

  Widget _drawerItem(String iconPath, String title) {
    return ListTile(
      leading: SvgPicture.asset(
        iconPath,
        color: AppColors.secondaryColor,
        width: 22,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'cairo',
          fontWeight: FontWeight.w700,
          color: Color(0xFFF9FAF8),
        ),
      ),
      onTap: () {},
    );
  }
}
