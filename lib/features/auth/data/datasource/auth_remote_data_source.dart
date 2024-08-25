import 'package:e_shop/core/app_preference/app_preferences.dart';
import 'package:e_shop/core/error/server_exception.dart';
import 'package:e_shop/features/auth/domain/usecase/login_use_case.dart';
import 'package:e_shop/features/auth/domain/usecase/sign_up_use_case.dart';
import 'package:e_shop/injection_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> login({
    required LoginParams loginParams,
  });
  Future<UserCredential> signUp({
    required SignUpParams signUpParams,
  });
  Future<bool> logout();
}

///SIGN UP ERRORS CODE
const firebaseAuthWeekPasswordErrorCode = 'weak-password';
const firebaseAuthEmailAlreadyInUserErrorCode = 'email-already-in-use';

///SIGN IN ERRORS CODE
const firebaseAuthInvalidCredentialCode = 'invalid-credential';
const firebaseAuthWrongPasswordCode = 'wrong-password';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuthInstance;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuthInstance,
  });

  @override
  Future<UserCredential> login({required LoginParams loginParams}) async {
    try {
      final UserCredential userCredential =
          await firebaseAuthInstance.signInWithEmailAndPassword(
              email: loginParams.email, password: loginParams.password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == firebaseAuthInvalidCredentialCode) {
        throw InvalidCredentialException(message: e.code);
      }
      rethrow;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      di.get<AppPreferences>().setUid(null);
      await Hive.deleteFromDisk();
      await firebaseAuthInstance.signOut();
      return true;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  @override
  Future<UserCredential> signUp({
    required SignUpParams signUpParams,
  }) async {
    try {
      final UserCredential userCredential =
          await firebaseAuthInstance.createUserWithEmailAndPassword(
              email: signUpParams.email, password: signUpParams.password);
      User user = userCredential.user!;
      user.updateDisplayName(signUpParams.displayName);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == firebaseAuthWeekPasswordErrorCode) {
        throw WeekPasswordException(message: e.code);
      }
      if (e.code == firebaseAuthEmailAlreadyInUserErrorCode) {
        throw EmailAlreadyInException(message: e.code);
      }

      rethrow;
    }
  }
}
