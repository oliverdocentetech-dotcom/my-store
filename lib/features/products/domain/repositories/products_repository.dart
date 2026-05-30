import 'package:store_demo_class/features/products/domain/models/category_model.dart';

abstract class ProductsRepository {
  Future<List<CategoryModel>> getCategories();
}