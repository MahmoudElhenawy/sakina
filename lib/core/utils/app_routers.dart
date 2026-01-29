import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakina/features/Hadith/models/hadith_chapter_model.dart';
import 'package:sakina/features/Hadith/screens/hadith_book_screen.dart';
import 'package:sakina/features/Quran/controllers/cubit/quran_cubit.dart';
import 'package:sakina/features/Quran/models/surah_model.dart';
import 'package:sakina/features/Quran/repo/quran_repository.dart';
import 'package:sakina/features/Quran/screens/surah_details_screen.dart';
import 'package:sakina/features/home/screens/nav_bar.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/splash/screens/splash_screen.dart';

abstract class AppRouter {
  static const homeScreen = '/homeScreen';
  static const navBarScreen = '/navBar';
  static const surahdetailsscreen = '/surahDetailsScreen';
  static const hadithBookScreen = '/hadithBookScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),

      GoRoute(
        path: homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRouter.navBarScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => QuranCubit(QuranRepository())..loadSurahs(),
            child: const NavBar(),
          );
        },
      ),

      GoRoute(
        path: surahdetailsscreen,
        builder: (context, state) =>
            SurahDetailsScreen(surah: state.extra as SurahModel),
      ),

      GoRoute(
        path: hadithBookScreen,
        builder: (context, state) {
          final chapter = state.extra as HadithChapterModel;
          return HadithBookScreen(chapter: chapter);
        },
      ),
    ],
  );
}
