import 'package:pet_vaccination/models/pet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository {
  final CollectionReference collection = Firestore.instance.collection('pets');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference> addPet(Pet pet) {
    return collection.add(pet.toJson());
  }

  updatePet(Pet pet) async {
    await collection
        .document(pet.reference.documentID)
        .updateData(pet.toJson());
  }
}
