import 'package:e_shop/core/Routes/app_route.dart';
import 'package:e_shop/core/app_preference/app_preferences.dart';
import 'package:e_shop/core/assets.dart';
import 'package:e_shop/core/utils/overlay_message_util.dart';
import 'package:e_shop/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:e_shop/features/auth/presentation/widgets/login_form_widget.dart';
import 'package:e_shop/injection_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoadedState) {
          if (state.loginParams.saveCredentials) {
            di.get<AppPreferences>().setLoginEmail(state.loginParams.email);
            di.get<AppPreferences>().setLoginPwd(state.loginParams.password);
          }
          print(state.userCredential.user?.uid);
          di.get<AppPreferences>().setUid(state.userCredential.user?.uid);

          print(di.get<AppPreferences>().getUid());
          OverlayMessageUtil.showSuccessOverlayMessage('Login successfully !');
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouteName.productsScreen,
            (route) => false,
          );
        }
        if (state is AuthErrorState) {
          OverlayMessageUtil.showErrorOverlayMessage(state.message);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),

                /// Logo
                Center(
                  child: Image.asset(
                    Assets.mlkLogo,
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),

                /// Welcoming Text
                Text(
                  'Let’s Sign in !',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lato',
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),

                ///  Login Text
                Text(
                  'Login To Your Account',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontFamily: 'Lato',
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const LoginFormWidget(),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don’t have an account ?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: ' Sign Up',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRouteName.signUpScreen,
                                (route) => false,
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
