import 'package:dartz/dartz.dart';
import 'package:real_estate/feautre/contact_us/domain/entity/contact.dart';

import '../../../../core/error/failer.dart';


abstract class ContactRepository{
  Future<Either<Failure, Unit>> savedMessage(Contact contact);
}