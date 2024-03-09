import 'package:test/test.dart';
import 'package:ws_work_test_mobile/app/domain/dto/params/auth_param.dart';

void main() {
  group('AuthParams', () {
    test('Accessing phoneNumber on an email AuthParam should throw', () {
      final authParams = AuthParam.email(
        email: 'test@email.com',
        password: 'password',
      );

      expect(authParams.email, 'test@email.com');
      expect(authParams.password, 'password');
      expect(() => authParams.phoneNumber, throwsA(isA<Error>()));
    });

    test('Accessing email on a phone AuthParam should throw', () {
      final authParams = AuthParam.phone(
        phoneNumber: '1234567890',
      );

      expect(() =>authParams.password, throwsA(isA<Error>()));
      expect(authParams.phoneNumber, '1234567890');
      expect(() => authParams.email, throwsA(isA<Error>()));
    });

    test('Anonymous AuthParam accessors should throw', () {
      final authParams = AuthParam.anonymous();

      expect(() => authParams.email, throwsA(isA<Error>()));
      expect(() => authParams.password, throwsA(isA<Error>()));
      expect(() => authParams.phoneNumber, throwsA(isA<Error>()));
    });

    test('PhoneWithVerificationId AuthParam accessors should throw', () {
      final authParams = AuthParam.phoneWithVerificationId(
        phoneNumber: '1234567890',
        verificationId: '123456',
      );

      expect(() => authParams.email, throwsA(isA<Error>()));
      expect(() => authParams.password, throwsA(isA<Error>()));
    });
  });
}
