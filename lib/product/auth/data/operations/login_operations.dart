import 'package:f41/product/auth/data/repositories/user_repository.dart';
import 'package:f41/product/helpers/token_operations.dart';
import 'package:injectable/injectable.dart';

import '../../../models/user/request/user_request.dart';
import '../../../models/user/response/user_response.dart';

abstract class ILoginOperations {
  Future<bool> login(UserRequest userRequest);
}

@Injectable(as: ILoginOperations)
class LoginOperations implements ILoginOperations {
  final IUserRepository _userRepository;
  LoginOperations(this._userRepository);

  @override
  Future<bool> login(UserRequest userRequest) async {
    bool isNewUser = false;

    UserResponse? userResponse = await _userRepository
        .getByUserId(userRequest.id ?? "")
        .catchError((onError) {
      return null;
    });
    if (userResponse is! UserResponse) {
      await _userRepository.addUser(userRequest).catchError((onError) {
        print(onError);
        return null;
      });
      isNewUser = true;
    }
    await TokenOperations.registerToken(
        userResponse ?? UserResponse(id: userRequest.id));
    return isNewUser;
  }
}
