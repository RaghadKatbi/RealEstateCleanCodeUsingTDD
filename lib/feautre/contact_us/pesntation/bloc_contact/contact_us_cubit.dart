import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:real_estate/feautre/contact_us/data/model/contact_model.dart';
import 'package:real_estate/feautre/contact_us/domain/usecase/contact_usecase.dart';
import '../../../../core/error/failer.dart';
part 'contact_us_state.dart';


class ContactUsCubit extends Cubit<ContactUsState> {
  final ContactUseCase contactUsUseCase;

  ContactUsCubit({required this.contactUsUseCase}) : super(ContactUsInitial());

  void contactUs(String name, String phone, String message) {
    emit(ContactUsLoading());
    final response = contactUsUseCase(ContactModel(
        id: 0,
        name: name,
        message: message,
        createdAt: "createdAt",
        updatedAt: "updatedAt",
        phone: phone));
      print(response);
      emit(ContactUsFailure(message: _mapFailureToMessage(response.toString() as Failure)));
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "SERVER_FAILURE_MESSAGE";
      case OfflineFailure:
        return "تأكد من اتصال جهازك بلانترنت";
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
