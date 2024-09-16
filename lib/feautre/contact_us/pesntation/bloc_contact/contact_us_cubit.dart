import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_estate/feautre/contact_us/data/model/contact_model.dart';
import 'package:real_estate/feautre/contact_us/domain/usecase/contact_usecase.dart';
import '../../../../core/error/failer.dart';
import '../../../../core/error/function_error.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final ContactUseCase contactUsUseCase;

  ContactUsCubit({required this.contactUsUseCase}) : super(ContactUsInitial());

  void contactUs(String name, String phone, String message) async {
    emit(ContactUsLoading());
    final contactModel = ContactModel(
        id: 0,
        name: name,
        message: message,
        createdAt: "createdAt",
        updatedAt: "updatedAt",
        phone: phone);
    final response = await contactUsUseCase(contactModel);
    print(response);
    response.fold(
      (l) => emit(ContactUsFailure(
          message: mapFailureToMessage(l))),
      (r) => emit(ContactUsSuccess()),
    );
  }

}
