import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/src/core/services/auth_service.dart';
import 'package:myapp/src/features/auth/screens/login_screen.dart';
import 'package:provider/provider.dart';

class MockAuthService extends Mock implements AuthService {}

void main() {
  testWidgets('LoginScreen has email, password, and login button', (WidgetTester tester) async {
    await tester.pumpWidget(
      Provider<AuthService>(
        create: (_) => MockAuthService(),
        child: const MaterialApp(
          home: LoginScreen(),
        ),
      ),
    );

    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });
}
