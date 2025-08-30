import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/src/core/services/firestore_service.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

void main() {
  group('FirestoreService', () {
    test('can be instantiated', () {
      final firestoreService = FirestoreService(
        firestore: MockFirebaseFirestore(),
      );
      expect(firestoreService, isNotNull);
    });
  });
}
