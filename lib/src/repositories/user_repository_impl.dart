import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hrv4life_core/hrv4life_core.dart';
import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  UserRepositoryImpl({
    required this.restClient
    });
  
  final RestClient restClient;

  @override
  Future<Either<AuthException, String>> login(String email, String password) async {
    try{
    final Response(data:{'access_token' : accesstoken }) = await restClient.unAuth.post('/auth',data: {
        'email':email,
        'password':password,
        'admin':true
      });
      return Right(accesstoken);
    }on DioException catch(e,s){
      log('Erro ao realizar Login', error: e, stackTrace: s);
      return switch(e) {
        DioException( response : Response(statusCode : HttpStatus.forbidden)?)=>
          Left(AuthUnauthorizedException()),
          _=>Left(AuthError(message: 'Erro ao realizar Login'),),
      };
    }
  }
}