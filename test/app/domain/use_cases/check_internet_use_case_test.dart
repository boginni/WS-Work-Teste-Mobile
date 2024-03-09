import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:ws_work_test_mobile/app/domain/use_cases/check_internet_use_case.dart';

import 'check_internet_use_case_test.mocks.dart';

@GenerateMocks([CheckInternetUseCase])
void main() {
    group('CheckInternetUsecase', () {
        late CheckInternetUseCase useCase;


        setUp(() {
            useCase = MockCheckInternetUseCase();
        });
        
        test('should return true when lookup returns a non-empty list', () async {
            when(useCase()).thenAnswer((_) async => true);
            final result = await useCase();
            expect(result, true);
        });
        
        test('should return false when lookup throws a SocketException', () async {
            when(useCase()).thenAnswer((_) async => false);
            final result = await useCase();
            expect(result, false);
        });

    });
}