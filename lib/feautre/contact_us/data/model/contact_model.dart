import 'package:real_estate/feautre/contact_us/domain/entity/contact.dart';

class ContactModel extends Contact {
  const ContactModel(
      {required super.id,
      required super.name,
      required super.message,
      required super.createdAt,
      required super.updatedAt,
      required super.phone});

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
        id: json['id'],
        name: json['name'],
        message: json['message'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        phone: json['phone']);
  }
}