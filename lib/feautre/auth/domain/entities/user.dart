import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String phone;
  final String updatedAt;
  final String createdAt;
  final int id;

  const User({
    required this.name,
    required this.phone,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  @override
  List<Object?> get props => [id, createdAt, updatedAt, name, phone];
}
