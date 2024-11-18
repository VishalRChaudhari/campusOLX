import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {}

createAD(
  String adTitle,
  adDescription,
  adCategory,
  adPrice,
) async {
  await FirebaseFirestore.instance.collection('Items').doc(adCategory).set({
    'title': adTitle,
    'description': adDescription,
    'price': adPrice,
  });
}
