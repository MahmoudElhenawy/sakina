import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/Adhkar/controllers/azkar_cubit.dart';
import 'package:sakina/features/Adhkar/controllers/azkar_state.dart';
import 'package:sakina/features/Adhkar/repo/adhkar_repository.dart';

import '../widgets/azkar_card.dart';

class AzkarListScreen extends StatefulWidget {
  final String categoryName;

  const AzkarListScreen({super.key, required this.categoryName});

  @override
  State<AzkarListScreen> createState() => _AzkarListScreenState();
}

class _AzkarListScreenState extends State<AzkarListScreen> {
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
          AzkarCubit(AzkarRepository())
            ..loadAzkarByCategory(widget.categoryName),
      child: Scaffold(
        backgroundColor: AppColors.backgroundScaffold,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            widget.categoryName,
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
        ),
        body: BlocBuilder<AzkarCubit, AzkarState>(
          builder: (context, state) {
            if (state is AzkarLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.goldMedium),
              );
            }

            if (state is AzkarLoaded) {
              return Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: state.azkar.length,
                    itemBuilder: (context, index) {
                      return AzkarCard(
                        azkar: state.azkar[index],
                        currentIndex: index,
                        totalCount: state.azkar.length,
                      );
                    },
                  ),

                  // Navigation buttons
                  if (_currentPage < state.azkar.length - 1)
                    Positioned(
                      right: 8,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: _buildNavButton(
                          icon: Icons.arrow_forward_ios,
                          onTap: () => _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                        ),
                      ),
                    ),

                  if (_currentPage > 0)
                    Positioned(
                      left: 8,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: _buildNavButton(
                          icon: Icons.arrow_back_ios_new,
                          onTap: () => _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                        ),
                      ),
                    ),

                  // Page indicators
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: _buildPageIndicators(state.azkar.length),
                  ),
                ],
              );
            }

            if (state is AzkarError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: AppColors.textPrimary),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildNavButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.goldMedium, AppColors.goldLight],
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowGold,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, color: AppColors.cardBackground, size: 20),
      ),
    );
  }

  Widget _buildPageIndicators(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count > 10 ? 10 : count, (index) {
        int displayIndex = index;
        if (count > 10 && index >= 5) {
          displayIndex = count - 10 + index;
        }

        bool isActive = _currentPage == displayIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: isActive ? 24 : 8,
          decoration: BoxDecoration(
            gradient: isActive
                ? const LinearGradient(
                    colors: [AppColors.goldMedium, AppColors.goldLight],
                  )
                : null,
            color: isActive ? null : AppColors.borderMedium.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: AppColors.goldMedium.withOpacity(0.4),
                      blurRadius: 8,
                    ),
                  ]
                : null,
          ),
        );
      }),
    );
  }
}
