import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sakina/core/utils/constant.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundScaffold,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40),
            decoration: const BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: const Text(
              'سَكِينَة',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 16),

          _drawerItem(Icons.menu_book, ''),
          _drawerItem(Icons.favorite, 'الأذكار'),
          _drawerItem(Icons.access_time, 'مواعيد الصلاة'),
          _drawerItem(Icons.settings, 'الإعدادات'),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: AppColors.secondaryColor),
      title: Text(
        title,
        style: const TextStyle(fontSize: 15, color: AppColors.textPrimary),
      ),
      onTap: () {},
    );
  }
}
