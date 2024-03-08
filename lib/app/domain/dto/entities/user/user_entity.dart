import '../entity.dart';

abstract class UserEntity implements Entity {
  final int id;
  final String name;

  const UserEntity({
    required this.id,
    required this.name,
  });
}
