import 'package:myapp/features/product/domain/entities/category_entity.dart';
import 'package:myapp/features/product/domain/services/category_service.dart';

class MockCategoryService implements CategoryService {
  @override
  Future<List<CategoryEntity>> getCategories() async {
    // Simulate a network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return sample categories
    return [
      const CategoryEntity(id: 1, name: 'Electronics'),
      const CategoryEntity(id: 2, name: 'Clothing'),
      const CategoryEntity(id: 3, name: 'Groceries'),
      const CategoryEntity(id: 4, name: 'Home & Garden'),
      const CategoryEntity(id: 5, name: 'Books'),
    ];
  }
}