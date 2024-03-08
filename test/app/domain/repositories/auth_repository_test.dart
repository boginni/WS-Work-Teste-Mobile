import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:ws_work_test_mobile/app/domain/dto/params/auth_param.dart';
import 'package:ws_work_test_mobile/app/domain/repositories/auth_repository.dart';
import 'package:ws_work_test_mobile/app/external/repositories/auth/anonymous_auth_repository.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([FirebaseAuth, UserCredential, User])
void main() {
  group('AuthRepository', () {
    late FirebaseAuth mockFirebase;
    late AuthRepository anonymousAuthRepository;
    late UserCredential userCredential;
    late User user;

    setUp(() {
      mockFirebase = MockFirebaseAuth();
      anonymousAuthRepository = AnonymousAuthRepository(firebaseAuth: mockFirebase);
      userCredential = MockUserCredential();
      user = MockUser();
    });

    test('should sign in', () async {
      when(mockFirebase.signInAnonymously()).thenAnswer(
        (_) async => userCredential,
      );

      when(userCredential.user).thenAnswer(
        (_) => user,
      );

      when(user.getIdToken()).thenAnswer(
        (_) async => '1234567890',
      );

      final result = await anonymousAuthRepository.signIn(AuthParam.anonymous());

      expect(result.token, '1234567890');
    });

    test('should throw an exception when sign in fails', () async {
      when(mockFirebase.signInAnonymously()).thenThrow(
        FirebaseAuthException(code: 'ERROR', message: 'An error occurred'),
      );

      expect(
        () async => await anonymousAuthRepository.signIn(AuthParam.anonymous()),
        throwsA(isA<Exception>()),
      );
    });

    test('should sign up', () async {
      when(mockFirebase.signInAnonymously()).thenAnswer(
        (_) async => userCredential,
      );

      when(userCredential.user).thenAnswer(
        (_) => user,
      );

      when(user.getIdToken()).thenAnswer(
        (_) async => '1234567890',
      );


      expect(() async => await anonymousAuthRepository.signUp(AuthParam.anonymous()), isA<void>());
    });

    test('should throw an exception when sign up fails', () async {
      when(mockFirebase.signInAnonymously()).thenThrow(
        FirebaseAuthException(code: 'ERROR', message: 'An error occurred'),
      );

      expect(
        () async => await anonymousAuthRepository.signUp(AuthParam.anonymous()),
        throwsA(isA<Exception>()),
      );
    });

    test('should throw an exception when sign in fails', () async {
      when(mockFirebase.signInAnonymously()).thenThrow(
        FirebaseAuthException(code: 'ERROR', message: 'An error occurred'),
      );

      expect(
        () async => await anonymousAuthRepository.signIn(AuthParam.anonymous()),
        throwsA(isA<Exception>()),
      );
    });

    test('should sign out', () async {
      when(mockFirebase.signOut()).thenAnswer(
        (_) async {},
      );

      expect(() async => await anonymousAuthRepository.signOut(), isA<void>());
    });
  });
}
