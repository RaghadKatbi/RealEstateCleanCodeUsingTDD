import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String phone;
  final String updatedAt;
  final String createdAt;
  final int id;

  const User(
    this.name,
    this.phone,
    this.updatedAt,
    this.createdAt,
    this.id,
  );

  @override
  List<Object?> get props => [id, createdAt, updatedAt, name, phone];
}
