import 'dart:io';

import '../../domain/use_cases/check_internet_use_case.dart';

typedef LookupFunction = Future<List<int>> Function();

class CheckInternetUseCaseImpl extends CheckInternetUseCase {
  const CheckInternetUseCaseImpl({required this.lookupFunction});

  final LookupFunction lookupFunction;

  @override
  Future<bool> call() async {
    try {
      final result = await lookupFunction();
      return result.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
