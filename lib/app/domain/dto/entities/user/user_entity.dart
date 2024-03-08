import '../entity.dart';

class UserEntity implements Entity {
  final String id;
  final String name;

  const UserEntity({
    required this.id,
    required this.name,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
