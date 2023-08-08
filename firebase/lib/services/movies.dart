import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('movies');

Future<List<Map<String, Object?>>> getMoviesData() async {
  QuerySnapshot querySnapshot = await _collectionRef.get();
  final movies = querySnapshot.docs
      .map((doc) => {
            'id': doc.id,
            'title': (doc.data() as Map<String, Object?>)['title']
          })
      .toList();
  return movies;
}

Future<void> deleteMovie(String id) {
  return _collectionRef.doc(id).delete();
}
