import 'package:flutter_test/flutter_test.dart';
import 'package:lune/features/core/main/ui/ui.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
    });
  });
}
