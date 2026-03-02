import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/core/widgets/custom_app_bar.dart';
import 'package:sakina/features/drawer/screens/qibla_screen.dart';
import 'package:sakina/features/drawer/screens/tasbih_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundScaffold,
      child: Column(
        children: [
          const SizedBox(height: 20),

          const CustomAppBar(showMenu: false),

          const SizedBox(height: 16),

          _drawerItem(
            context,
            'assets/images/tasbih.svg',
            'السبحة الإلكترونية',
            const TasbihScreen(),
          ),

          _drawerItem(
            context,
            'assets/images/qbla.svg',
            'القبلة',
            const QiblaScreen(),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context,
    String iconPath,
    String title,
    Widget page,
  ) {
    return ListTile(
      leading: SvgPicture.asset(
        iconPath,
        color: AppColors.secondaryColor,
        width: 22,
      ),
      title: const Text(''),
      subtitle: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'cairo',
          fontWeight: FontWeight.w700,
          color: Color(0xFFF9FAF8),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
