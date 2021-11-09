import 'package:flutter_test/flutter_test.dart';
import 'package:future_builder_app/main.dart';

void main() {
  test('Testing number of users function', () {
    expect(MyApp().NumberofUsersDisplayed(6), 6);
  });
}
