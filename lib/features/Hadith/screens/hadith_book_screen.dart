import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/Hadith/controllers/HadithCubit/hadith_cubit.dart';
import 'package:sakina/features/Hadith/controllers/HadithCubit/hadith_state.dart';
import 'package:sakina/features/Hadith/models/hadith_chapter_model.dart';
import 'package:sakina/features/Hadith/repo/hadith_repositor.dart';
import 'package:sakina/features/Hadith/widgets/hadith_card.dart';
import 'package:sakina/features/Hadith/widgets/navigation_button.dart';
import 'package:sakina/features/Hadith/widgets/page_indicators.dart';

class HadithBookScreen extends StatefulWidget {
  final HadithChapterModel chapter;
  const HadithBookScreen({super.key, required this.chapter});

  @override
  State<HadithBookScreen> createState() => _HadithBookScreenState();
}

class _HadithBookScreenState extends State<HadithBookScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HadithCubit(HadithRepository())..loadHadiths(widget.chapter),
      child: Scaffold(
        backgroundColor: AppColors.backgroundScaffold,
        appBar: _buildAppBar(),
        body: BlocBuilder<HadithCubit, HadithState>(
          builder: (context, state) {
            if (state is HadithLoading) {
              return _buildLoadingState();
            }

            if (state is HadithsLoaded) {
              return _buildLoadedState(state);
            }

            if (state is HadithError) {
              return _buildErrorState(context, state);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        widget.chapter.arabic,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppColors.goldLight,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: AppColors.goldMedium),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: AppColors.goldMedium,
            strokeWidth: 3,
          ),
          const SizedBox(height: 16),
          Text(
            'جاري تحميل الأحاديث...',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textPrimary.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadedState(HadithsLoaded state) {
    return Stack(
      children: [
        // PageView for hadiths
        PageView.builder(
          controller: _pageController,
          itemCount: state.hadiths.length,
          itemBuilder: (context, index) {
            return HadithCard(
              hadith: state.hadiths[index],
              currentIndex: index,
              totalCount: state.hadiths.length,
            );
          },
        ),

        // Navigation buttons
        if (_currentPage < state.hadiths.length - 1)
          NavigationButton(
            isNext: true,
            onTap: () => _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),

        if (_currentPage > 0)
          NavigationButton(
            isNext: false,
            onTap: () => _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),

        // Page indicators
        PageIndicators(
          totalCount: state.hadiths.length,
          currentPage: _currentPage,
        ),
      ],
    );
  }

  Widget _buildErrorState(BuildContext context, HadithError state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: AppColors.goldMedium.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          const Text(
            'حدث خطأ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              state.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textPrimary.withOpacity(0.7),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              context.read<HadithCubit>().loadHadiths(widget.chapter);
            },
            icon: const Icon(Icons.refresh),
            label: const Text('إعادة المحاولة'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.goldMedium,
              foregroundColor: AppColors.cardBackground,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
            ),
          ),
        ],
      ),
    );
  }
}
