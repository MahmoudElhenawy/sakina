import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/core/widgets/app_drawer.dart';
import 'package:sakina/core/widgets/custom_app_bar.dart';
import 'package:sakina/features/Adhkar/controllers/azkar_cubit.dart';
import 'package:sakina/features/Adhkar/controllers/azkar_state.dart';
import 'package:sakina/features/Adhkar/repo/adhkar_repository.dart';
import 'package:sakina/features/Adhkar/screens/azkar_list_screen.dart';
import 'package:sakina/features/Quran/widgets/quran_search_bar.dart';
import '../widgets/category_card.dart';

class AdhkarScreen extends StatefulWidget {
  const AdhkarScreen({super.key});

  @override
  State<AdhkarScreen> createState() => _AdhkarScreenState();
}

class _AdhkarScreenState extends State<AdhkarScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AzkarCubit(AzkarRepository())..loadCategories(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundScaffold,
        appBar: CustomAppBar(),
        drawer: AppDrawer(),
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Builder(
                  builder: (context) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: QuranSearchBar(
                      onChanged: (value) {
                        //context.read<AzkarCubit>().filterCategories(value);
                      },
                      controller: controller,
                      hintText: 'ابحث عن الأذكار...',
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  // ده اللي بيحل مشكلة الـ Layout
                  child: BlocBuilder<AzkarCubit, AzkarState>(
                    builder: (context, state) {
                      if (state is AzkarLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.goldMedium,
                          ),
                        );
                      }

                      if (state is CategoriesLoaded) {
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            //vertical: 8,
                          ),
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) {
                            final category = state.categories[index];
                            return CategoryCard(
                              category: category,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => AzkarListScreen(
                                      categoryName: category.name,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }

                      if (state is AzkarError) {
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
