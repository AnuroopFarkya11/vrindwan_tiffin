import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/core/service/api_service/api_service.dart';

abstract class AuthRepository{
  final DioClient dioClient = DioClient(dio: Dio());
  final FirebaseAuth auth = FirebaseAuth.instance;
}
