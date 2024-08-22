import 'package:equatable/equatable.dart';

class Verification extends Equatable {
  final String code;

  const Verification({required this.code});

  @override
  List<Object?> get props => [code];
}
