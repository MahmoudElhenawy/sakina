import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina/features/Adhkar/models/azkar_category_model.dart';
import 'package:sakina/features/Adhkar/repo/adhkar_repository.dart';

import 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  final AzkarRepository repository;

  AzkarCubit(this.repository) : super(AzkarInitial());

  Future<void> loadCategories() async {
    try {
      emit(AzkarLoading());

      final allAzkar = await repository.getAllAzkar();

      // Group by category and count
      final Map<String, int> categoryCount = {};
      for (var azkar in allAzkar) {
        categoryCount[azkar.category] =
            (categoryCount[azkar.category] ?? 0) + 1;
      }

      final categories = categoryCount.entries
          .map((e) => AzkarCategoryModel(name: e.key, count: e.value))
          .toList();

      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(AzkarError(e.toString()));
    }
  }

  Future<void> loadAzkarByCategory(String category) async {
    try {
      emit(AzkarLoading());
      final azkar = await repository.getAzkarByCategory(category);
      emit(AzkarLoaded(azkar, category));
    } catch (e) {
      emit(AzkarError(e.toString()));
    }
  }
}
