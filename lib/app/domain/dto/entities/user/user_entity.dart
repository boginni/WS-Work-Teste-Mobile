import '../entity.dart';

class UserEntity implements Entity {
  final String id;
  final String name;
  final String? email;

  const UserEntity({
    required this.id,
    required this.name,
    this.email,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
