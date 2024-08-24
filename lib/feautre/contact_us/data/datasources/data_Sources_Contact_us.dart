import 'package:real_estate/core/api/end_ponits.dart';
import 'package:real_estate/feautre/contact_us/data/model/contact_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/error/exptions.dart';

abstract class DataSourcesContactUs {
  Future<String> contactUs(ContactModel contact);
}

class DataSourcesContactUsImplement implements DataSourcesContactUs {
  final ApiConsumer api;

  DataSourcesContactUsImplement({required this.api});

  @override
  Future<String> contactUs(ContactModel contact) async {
    try {
      final response= await api.post(EndPoint.contactUs,queryParameters: {
        ApiKey.name:contact.name,
        ApiKey.phone:contact.phone,
        ApiKey.message:contact.message
      });
      return response[ApiKey.message];
    } on ServerException {
      throw ServerException();
    }
  }
}
