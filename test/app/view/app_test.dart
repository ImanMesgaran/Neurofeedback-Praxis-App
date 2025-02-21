import 'package:flutter_test/flutter_test.dart';
import 'package:neurofeedback_praxis_app/app/app.dart';
import 'package:neurofeedback_praxis_app/features/onboarding/presentation/pages/splash_screen.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(SplashScreen), findsOneWidget);
    });
  });
}
