import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/Quran/controllers/reader_cubit/quran_reader_cubit.dart';
import 'package:sakina/features/Quran/controllers/reader_cubit/quran_reader_state.dart';
import 'package:sakina/features/Quran/models/surah_model.dart';
import 'package:sakina/features/Quran/models/verse_model.dart';
import 'package:sakina/features/Quran/screens/quran_page.dart';
import 'package:sakina/features/Quran/widgets/quran_bottom_bar.dart';
import 'package:sakina/features/Quran/widgets/quran_paginator.dart';
import 'package:sakina/features/Quran/widgets/surah_details_appBar.dart';

class SurahDetailsScreen extends StatefulWidget {
  final SurahModel surah;

  const SurahDetailsScreen({super.key, required this.surah});

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  late final PageController _pageController;
  late final List<List<VerseModel>> pages;

  @override
  void initState() {
    super.initState();
    pages = QuranPaginator.paginate(widget.surah.verses, versesPerPage: 7);
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuranReaderCubit(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundScaffold,

        appBar: SurahDetailsAppBar(title: widget.surah.name),

        body: PageView.builder(
          controller: _pageController,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return BlocBuilder<QuranReaderCubit, QuranReaderState>(
              builder: (_, state) {
                return QuranPage(
                  verses: pages[index],
                  fontSize: state.fontSize,
                );
              },
            );
          },
        ),

        bottomNavigationBar: QuranBottomBar(
          controller: _pageController,
          totalPages: pages.length,
        ),
      ),
    );
  }
}
