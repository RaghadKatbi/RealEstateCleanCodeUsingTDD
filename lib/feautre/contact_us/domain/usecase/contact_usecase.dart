import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';
import 'package:real_estate/feautre/contact_us/domain/repository/contact_repository.dart';

import '../entity/contact.dart';

class ContactUseCase{
  final ContactRepository repository ;

  ContactUseCase({required this.repository});

  Future<Either<Failure,Unit>> call(Contact contact)async{
    return await repository.savedMessage(contact);
  }

}