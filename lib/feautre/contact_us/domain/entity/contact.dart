import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final int id;
  final String name;
  final String message;
  final String createdAt;
  final String updatedAt;
  final String phone;

  const Contact(
      {required this.id,
      required this.name,
      required this.message,
      required this.createdAt,
      required this.updatedAt,
      required this.phone});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, message, createdAt, updatedAt, phone];
}
