abstract class Failure implements Exception {
  /// A descriptive message about the failure.
  String? get message;

  const Failure();
}

class MapperError extends Failure {
  const MapperError([this.message]);

  @override
  final String? message;
}

class DesserializeError extends Failure {
  const DesserializeError([this.message]);

  @override
  final String? message;
}
