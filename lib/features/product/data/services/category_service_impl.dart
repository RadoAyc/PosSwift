import 'package:myapp/features/product/domain/entities/category_entity.dart';
import 'package:myapp/features/product/domain/services/category_service.dart';

class CategoryServiceImpl implements CategoryService {
  @override
  Future<List<CategoryEntity>> getCategories() async {
    // TODO: Implement actual category fetching from a data source (e.g., API, database)
    // This is a mock implementation
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay
    return [
      CategoryEntity(id: 1, name: 'Electronics'),
      CategoryEntity(id: 2, name: 'Clothing'),
      CategoryEntity(id: 3, name: 'Groceries'),
      CategoryEntity(id: 4, name: 'Home & Garden'),
      CategoryEntity(id: 5, name: 'Books'),
    ];
  }
}