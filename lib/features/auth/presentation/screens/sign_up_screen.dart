import 'package:e_shop/core/Routes/app_route.dart';
import 'package:e_shop/core/assets.dart';
import 'package:e_shop/core/utils/overlay_message_util.dart';
import 'package:e_shop/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:e_shop/features/auth/presentation/widgets/sign_up_form_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is SignUpLoadedState) {
          OverlayMessageUtil.showSuccessOverlayMessage('SignUp successfully !');
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouteName.loginScreen,
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
                  'Let’s Sign Up !',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lato',
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),

                ///  SignUp Text
                Text(
                  'Sign Up To Your Account',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontFamily: 'Lato',
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SignUpFormWidget(),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account ?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: ' Sign In',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRouteName.loginScreen,
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
