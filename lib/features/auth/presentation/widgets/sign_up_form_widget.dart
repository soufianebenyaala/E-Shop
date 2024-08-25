import 'package:e_shop/core/utils/validations_utils.dart';
import 'package:e_shop/core/widgets/global_text_form_field_widget.dart';
import 'package:e_shop/features/auth/domain/usecase/sign_up_use_case.dart';
import 'package:e_shop/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();
  final TextEditingController displayNameTEC = TextEditingController();
  bool isSaveCredentials = true;

  bool isPwdTxtObscure = true;
  void signUpHandler() {
    if (signUpFormKey.currentState!.validate() == true) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpEvent(
          signUpParams: SignUpParams(
            email: emailTEC.text,
            password: passwordTEC.text,
            displayName: displayNameTEC.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Authentication TextFields
          GlobalTextFormFieldWidget(
            validator: ValidationsUtils.isValidEmailAndRequired,
            controller: emailTEC,
            hintText: 'Enter your email',
            labelText: 'Email',
            prefixIcon: const Icon(
              FontAwesomeIcons.userLarge,
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          /// Password Section
          GlobalTextFormFieldWidget(
            validator: ValidationsUtils.isRequired,
            obscureText: isPwdTxtObscure,
            controller: passwordTEC,
            hintText: 'Enter your password',
            labelText: 'Password',
            prefixIcon: const Icon(
              FontAwesomeIcons.lock,
            ),
            suffixIcon: isPwdTxtObscure
                ? IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.solidEye,
                    ),
                    onPressed: () {
                      setState(() {
                        isPwdTxtObscure = !isPwdTxtObscure;
                      });
                    })
                : IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.solidEyeSlash,
                    ),
                    onPressed: () {
                      setState(() {
                        isPwdTxtObscure = !isPwdTxtObscure;
                      });
                    }),
          ),
          const SizedBox(
            height: 10,
          ),

          /// Authentication TextFields
          GlobalTextFormFieldWidget(
            validator: ValidationsUtils.isRequired,
            controller: displayNameTEC,
            hintText: 'Enter your Name',
            labelText: 'Name',
            prefixIcon: const Icon(
              FontAwesomeIcons.person,
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),

          /// SignUp Button
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).colorScheme.primary.withOpacity(0.6),
                        Theme.of(context).colorScheme.primary.withOpacity(0.8),
                        Theme.of(context).colorScheme.primary,
                      ],
                    ),
                  ),
                  child: TextButton(
                    onPressed: signUpHandler,
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
