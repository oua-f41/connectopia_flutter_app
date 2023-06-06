import 'error.dart';

extension ErrorHandle on DefaultError {
  String handle() => when(
      apiError: ((error, stackTrace, errorModel) =>
          errorModel.error.toString()),
      businessError: ((error, stackTrace) => error.toString()),
      unknownError: ((error, stackTrace) => error.toString()));
}
