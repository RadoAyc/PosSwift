import 'package:myapp/features/product/domain/entities/category_entity.dart';

abstract class CategoryService {
  Future<List<CategoryEntity>> getCategories();
}
