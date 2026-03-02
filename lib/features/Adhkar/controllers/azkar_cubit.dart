import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina/features/Adhkar/controllers/azkar_state.dart';
import 'package:sakina/features/Adhkar/models/azkar_category_model.dart';
import 'package:sakina/features/Adhkar/repo/adhkar_repository.dart';

class AzkarCubit extends Cubit<AzkarState> {
  final AzkarRepository repository;

  List<AzkarCategoryModel> _allCategories = [];

  AzkarCubit(this.repository) : super(AzkarInitial());

  Future<void> loadCategories() async {
    try {
      emit(AzkarLoading());

      final allAzkar = await repository.getAllAzkar();

      final Map<String, int> categoryCount = {};
      for (var azkar in allAzkar) {
        categoryCount[azkar.category] =
            (categoryCount[azkar.category] ?? 0) + 1;
      }

      _allCategories = categoryCount.entries
          .map((e) => AzkarCategoryModel(name: e.key, count: e.value))
          .toList();

      emit(CategoriesLoaded(_allCategories));
    } catch (e) {
      emit(AzkarError(e.toString()));
    }
  }

  void filterCategories(String query) {
    if (query.isEmpty) {
      emit(CategoriesLoaded(_allCategories));
      return;
    }

    final filtered = _allCategories
        .where(
          (category) =>
              category.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    emit(CategoriesLoaded(filtered));
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
