import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('categories');

Future<List<Map<String, Object?>>> getCategoriesData() async {
  QuerySnapshot querySnapshot = await _collectionRef.get();
  final categories = querySnapshot.docs
      .map((doc) => {
            'id': doc.id,
            'title': (doc.data() as Map<String, Object?>)['title']
          })
      .toList();
  return categories;
}

Future<void> deleteCategory(String id) {
  return _collectionRef.doc(id).delete();
}
