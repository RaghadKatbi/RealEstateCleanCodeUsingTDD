import 'failer.dart';

String mapFailureToMessage(Failure failure) {
  print(failure);
  switch (failure) {
    case ServerFailure _:
      return "حدثت مشكلة في الوصول الى البيانات تأكد من اتصالك بلانترنت و الرجاء المحاولة لاحقاَ";
    case OfflineFailure _:
      return "تأكد من اتصال جهازك بلانترنت";
    case PhoneOrPasswordUnCorrect _ :
      return "كلمة المرور غير متطابقة مع  رقم الهاتف ";
    case PhoneAlreadyUsedFailure _ :
      return "رقم الهاتف مستخدم مسبقاَ";
    default:
      return "خطأ غير متوقع حاول مرة أخرى";
  }
}