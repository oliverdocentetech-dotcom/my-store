import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_demo_class/features/products/data/products_repository_impl.dart';
import 'package:store_demo_class/features/products/domain/models/category_model.dart';
import 'package:store_demo_class/features/products/domain/repositories/products_repository.dart';

final firebaseFirestoreProvider = Provider<FirebaseFirestore>(
      (ref) => FirebaseFirestore.instance,
);

final productsRepositoryProvider = Provider<ProductsRepository>(
      (ref) => ProductsRepositoryImpl(firestore: ref.watch(firebaseFirestoreProvider)),
);

final categoriesProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final repository = ref.read(productsRepositoryProvider);

  return repository.getCategories();
});