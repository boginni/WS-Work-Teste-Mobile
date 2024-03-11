import '../../domain/errors/failure.dart';

abstract class FailureMessageExtractionService {
  String? extractMessage(Failure failure);

  String getErrorMessage(Failure failure);
}
