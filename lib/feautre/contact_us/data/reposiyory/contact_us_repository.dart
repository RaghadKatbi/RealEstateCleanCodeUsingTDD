import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';
import 'package:real_estate/feautre/contact_us/data/datasources/data_Sources_Contact_us.dart';
import 'package:real_estate/feautre/contact_us/data/model/contact_model.dart';
import 'package:real_estate/feautre/contact_us/domain/entity/contact.dart';
import 'package:real_estate/feautre/contact_us/domain/repository/contact_repository.dart';
import '../../../../core/network/network_info.dart';

class ContactUsRepositoryImplement implements ContactRepository {
  final DataSourcesContactUsImplement dataSourcesContactUsImplement;
  final NetworkInfo networkInfo;

  ContactUsRepositoryImplement(
      {required this.dataSourcesContactUsImplement, required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> savedMessage(Contact contact) async {
    final contactModel = ContactModel(id: contact.id,
        name: contact.name,
        message: contact.message,
        createdAt: contact.createdAt,
        updatedAt: contact.updatedAt,
        phone: contact.phone);
    if (await networkInfo.isConnected) {
       try {
         await dataSourcesContactUsImplement.contactUs(contactModel);
         return right(unit);
       }
       on ServerFailure catch(e){
         throw Exception(e.toString());
       }
    }
    else {
      return Left(OfflineFailure());
    }
  }

}