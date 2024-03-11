import '../entity.dart';

class UserCredentialEntity implements Entity {
  final String token;
  final String? refreshToken;

  const UserCredentialEntity({
    required this.token,
    this.refreshToken,
  });

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
