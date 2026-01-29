import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/core/widgets/custom_app_bar.dart';
import 'package:sakina/features/Hadith/controllers/HadithCubit/hadith_cubit.dart';
import 'package:sakina/features/Hadith/controllers/HadithCubit/hadith_state.dart';
import 'package:sakina/features/Hadith/repo/hadith_repositor.dart';
import 'package:sakina/features/Hadith/screens/hadith_book_screen.dart';

import 'package:sakina/features/Hadith/widgets/hadith_item.dart';
import 'package:sakina/features/Quran/widgets/quran_search_bar.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HadithCubit(HadithRepository())..loadChapters(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundScaffold,
        appBar: CustomAppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                QuranSearchBar(
                  controller: TextEditingController(),
                  onChanged: (q) {
                    context.read<HadithCubit>().search(q);
                  },
                ),

                const SizedBox(height: 24),

                Expanded(
                  child: BlocBuilder<HadithCubit, HadithState>(
                    builder: (context, state) {
                      if (state is HadithChaptersLoaded) {
                        return GridView.builder(
                          itemCount: state.filtered.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // 👈 اتنين قصاد بعض
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 1.1, // تظبيط الشكل
                              ),
                          itemBuilder: (_, i) {
                            final chapter = state.filtered[i];
                            return HadithItem(
                              chapter: chapter,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        HadithBookScreen(chapter: chapter),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }

                      if (state is HadithLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is HadithError) {
                        return Center(child: Text(state.message));
                      }

                      return const SizedBox();
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
