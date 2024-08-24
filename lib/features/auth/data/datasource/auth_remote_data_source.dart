import 'package:e_shop/core/error/server_exception.dart';
import 'package:e_shop/features/auth/domain/usecase/login_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> login({
    required LoginParams loginParams,
  });

  Future<bool> logout();
}

///SIGN UP ERRORS CODE
const firebaseAuthWeekPasswordErrorCode = 'weak-password';
const firebaseAuthEmailAlreadyInUserErrorCode = 'email-already-in-use';

///SIGN IN ERRORS CODE
const firebaseAuthInvalidCredentialCode = 'invalid-credential';
const firebaseAuthUserNotFoundCode = 'user-not-found';
const firebaseAuthWrongPasswordCode = 'wrong-password';
const firebaseAuthUserDisabled = 'user-disabled';
const firebaseEmailNotVerify = 'email-not-verify';
const firebaseToManyRequest = "too-many-requests";

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
      print('code : ${e.code}');
      print(e.code == firebaseAuthInvalidCredentialCode);
      if (e.code == firebaseAuthInvalidCredentialCode) {
        throw InvalidCredentialException(message: e.code);
      }
      rethrow;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await firebaseAuthInstance.signOut();
      return true;
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
