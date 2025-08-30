import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/src/core/services/auth_service.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

void main() {
  group('AuthService', () {
    test('can be instantiated', () {
      final authService = AuthService(
        firebaseAuth: MockFirebaseAuth(),
        firestore: MockFirebaseFirestore(),
      );
      expect(authService, isNotNull);
    });
  });
}
