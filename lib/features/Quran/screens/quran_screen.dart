import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sakina/core/utils/app_routers.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/core/widgets/app_drawer.dart';
import 'package:sakina/core/widgets/custom_app_bar.dart';
import 'package:sakina/features/Quran/controllers/cubit/quran_cubit.dart';
import 'package:sakina/features/Quran/controllers/cubit/quran_state.dart';
import 'package:sakina/features/Quran/widgets/quran_search_bar.dart';
import 'package:sakina/features/Quran/widgets/surah_item.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,
      drawer: const AppDrawer(),
      appBar: const CustomAppBar(),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              QuranSearchBar(
                controller: _searchController,
                onChanged: (value) {
                  context.read<QuranCubit>().search(value);
                },
              ),

              const SizedBox(height: 28),

              Expanded(
                child: BlocBuilder<QuranCubit, QuranState>(
                  builder: (context, state) {
                    if (state is QuranLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is QuranLoaded) {
                      if (state.filteredSurahs.isEmpty) {
                        return const Center(
                          child: Text(
                            'لا توجد نتائج',
                            style: TextStyle(color: AppColors.secondaryColor),
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: state.filteredSurahs.length,
                        itemBuilder: (context, index) {
                          final surah = state.filteredSurahs[index];
                          return SurahItem(
                            surah: surah,
                            onTap: () {
                              GoRouter.of(context).push(
                                AppRouter.surahdetailsscreen,
                                extra: surah,
                              );
                            },
                          );
                        },
                      );
                    }

                    if (state is QuranError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                      );
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
