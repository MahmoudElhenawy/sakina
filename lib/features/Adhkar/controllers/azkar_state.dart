import 'package:sakina/features/Adhkar/models/adhkar_model.dart';
import 'package:sakina/features/Adhkar/models/azkar_category_model.dart';

abstract class AzkarState {}

class AzkarInitial extends AzkarState {}

class AzkarLoading extends AzkarState {}

class CategoriesLoaded extends AzkarState {
  final List<AzkarCategoryModel> categories;

  CategoriesLoaded(this.categories);
}

class AzkarLoaded extends AzkarState {
  final List<AzkarModel> azkar;
  final String category;

  AzkarLoaded(this.azkar, this.category);
}

class AzkarError extends AzkarState {
  final String message;

  AzkarError(this.message);
}
