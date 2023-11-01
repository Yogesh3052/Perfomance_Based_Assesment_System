import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pba/widgets/toastMessage.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
Future<void> addDataToFirestore(BuildContext context, String department,
    String documentId, Map<String, dynamic> data) async {
  try {
    // Get a reference to the Firestore collection
    CollectionReference collectionReference = _firestore.collection(department);
    DocumentReference documentReference = collectionReference.doc(documentId);

    // Add the data to Firestore using the `add` method or `doc().set` method for a custom document ID
    await documentReference.set(data, SetOptions(merge: true));
    // await collectionReference.add(data);

    // Or, if you want to set a custom document ID:
    // await collectionReference.doc('customDocumentID').set(data);

    // Data added successfully
    print('Data added');

    // Hide the loading widget after data is uploade

    // Display the toast message to acknowledge successful upload
    Utils.toastMessage('Data successfully uploaded');
  } catch (e) {
    // Hide the loading widget if an error occurs

    // Handle errors
    print('Error adding data : $e');
    Utils.toastMessage('Failed to upload data');
  }
}

Future<void> updateDataInFirestore(BuildContext context, String collectionName,
    String documentId, Map<String, dynamic> dataToUpdate) async {
  try {
    // Get a reference to the Firestore document
    DocumentReference documentReference =
        _firestore.collection(collectionName).doc(documentId);

    // Update the data using the `update` method or `set` method with `merge: true` to merge the changes
    // Example using the `update` method:
    await documentReference.update(dataToUpdate);

    // Or, using the `set` method with `merge: true`:
    // await documentReference.set(dataToUpdate, SetOptions(merge: true));

    // Data updated successfully
    print('Data updated');

    // Hide the loading widget after data is updated

    // Display the toast message to acknowledge successful update
    Utils.toastMessage('Data successfully updated ');
  } catch (e) {
    // Hide the loading widget if an error occurs

    // Handle errors
    print('Error updating data in Firestore: $e');
    Utils.toastMessage('Failed to update data');
  }
}


