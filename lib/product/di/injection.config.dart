// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectopia/core/error/error_separator.dart' as _i8;
import 'package:connectopia/core/network/dio.dart' as _i11;
import 'package:connectopia/core/security/secure_storage.dart' as _i12;
import 'package:connectopia/product/auth/data/data_access/login_service.dart'
    as _i5;
import 'package:connectopia/product/auth/data/data_access/user_service.dart'
    as _i6;
import 'package:connectopia/product/auth/data/operations/login_operations.dart'
    as _i10;
import 'package:connectopia/product/auth/data/repositories/login_repository.dart'
    as _i7;
import 'package:connectopia/product/auth/data/repositories/user_repository.dart'
    as _i9;
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final secureStorageModule = _$SecureStorageModule();
    gh.singleton<_i3.Dio>(dioModule.dio());
    gh.singleton<_i4.FlutterSecureStorage>(secureStorageModule.secureStorage());
    gh.factory<_i5.ILoginService>(() => _i5.LoginManager(gh<_i3.Dio>()));
    gh.factory<_i6.IUserService>(() => _i6.UserManager(gh<_i3.Dio>()));
    gh.factory<_i7.ILoginRepository>(() => _i7.LoginRepository(
          gh<_i5.ILoginService>(),
          gh<_i8.ErrorSeparator>(),
        ));
    gh.factory<_i9.IUserRepository>(() => _i9.UserRepository(
          gh<_i6.IUserService>(),
          gh<_i8.ErrorSeparator>(),
        ));
    gh.factory<_i10.ILoginOperations>(
        () => _i10.LoginOperations(gh<_i9.IUserRepository>()));
    return this;
  }
}

class _$DioModule extends _i11.DioModule {}

class _$SecureStorageModule extends _i12.SecureStorageModule {}
