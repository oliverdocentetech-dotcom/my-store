import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_demo_class/features/products/domain/models/category_model.dart';
import 'package:store_demo_class/features/products/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {

  final FirebaseFirestore firestore;

  ProductsRepositoryImpl({required this.firestore});

  @override
  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await firestore.collection('categories').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return CategoryModel(
        id: doc.id,
        name: data['name'] ?? '',
        imageUrl: data['image_url'] ?? '',
      );
    }).toList();
  }

}