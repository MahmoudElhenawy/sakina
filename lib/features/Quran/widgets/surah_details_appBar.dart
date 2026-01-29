import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/Quran/controllers/reader_cubit/quran_reader_cubit.dart';
import 'package:sakina/features/Quran/controllers/reader_cubit/quran_reader_state.dart';
import 'package:sakina/features/Quran/widgets/glass_container.dart';

class SurahDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const SurahDetailsAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(92);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(28),
          ),
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
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6,
                  ),
                ),

                // ===== زر الرجوع =====
                Positioned(
                  left: 0,
                  child: GlassButton(
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.white,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ),

                Positioned(
                  right: 0,
                  child: BlocBuilder<QuranReaderCubit, QuranReaderState>(
                    builder: (_, state) {
                      return GlassContainer(
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, size: 18),
                              color: Colors.white,
                              onPressed: () => context
                                  .read<QuranReaderCubit>()
                                  .decreaseFont(),
                            ),
                            Text(
                              state.fontSize.toInt().toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, size: 18),
                              color: Colors.white,
                              onPressed: () => context
                                  .read<QuranReaderCubit>()
                                  .increaseFont(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
