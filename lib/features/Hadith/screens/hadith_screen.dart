import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/core/widgets/app_drawer.dart';
import 'package:sakina/core/widgets/custom_app_bar.dart';
import 'package:sakina/features/Hadith/controllers/HadithCubit/hadith_cubit.dart';
import 'package:sakina/features/Hadith/controllers/HadithCubit/hadith_state.dart';
import 'package:sakina/features/Hadith/screens/hadith_book_screen.dart';
import 'package:sakina/features/Hadith/widgets/hadith_item.dart';
import 'package:sakina/features/Quran/widgets/quran_search_bar.dart';

class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,
      appBar: CustomAppBar(),
      drawer: const AppDrawer(),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              QuranSearchBar(
                hintText: 'ابحث عن الحديث...',
                controller: controller,
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
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 1.1,
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
    );
  }
}
