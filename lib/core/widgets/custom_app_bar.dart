import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sakina/core/utils/constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showMenu;

  const CustomAppBar({super.key, this.showMenu = true});

  @override
  Size get preferredSize => const Size.fromHeight(82);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(26)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Text(
                'سَكِينَة',
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 22,
                  fontFamily: 'cairo',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),

              if (showMenu)
                Positioned(
                  right: 16,
                  child: Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: AppColors.secondaryColor,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
