import 'package:equatable/equatable.dart';

class City extends Equatable {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final String cityImage;

  const City({required this.id,required this.name, required this.createdAt,required this.updatedAt,required this.cityImage});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, createdAt, updatedAt, cityImage];
}
