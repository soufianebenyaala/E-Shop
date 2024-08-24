import 'package:e_shop/core/app_preference/app_preferences.dart';
import 'package:e_shop/core/utils/validations_utils.dart';
import 'package:e_shop/core/widgets/global_text_form_field_widget.dart';
import 'package:e_shop/features/auth/domain/usecase/login_use_case.dart';
import 'package:e_shop/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:e_shop/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();
  bool isSaveCredentials = true;

  bool isPwdTxtObscure = true;
  void loginHandler() {
    if (loginFormKey.currentState!.validate() == true) {
      BlocProvider.of<AuthBloc>(context).add(
        LoginEvent(
          loginParams: LoginParams(
            email: emailTEC.text,
            password: passwordTEC.text,
            saveCredentials: isSaveCredentials,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    initRememberCredentialsLogic();
  }

  @override
  void dispose() {
    super.dispose();
  }

  initRememberCredentialsLogic() {
    emailTEC.text = di.get<AppPreferences>().getLoginEmail();
    passwordTEC.text = di.get<AppPreferences>().getLoginPwd();

    if (emailTEC.text.isNotEmpty && passwordTEC.text.isNotEmpty) {
      emailTEC.selection = TextSelection.fromPosition(
          TextPosition(offset: emailTEC.text.length));
      passwordTEC.selection = TextSelection.fromPosition(
          TextPosition(offset: passwordTEC.text.length));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Authentication TextFields
          GlobalTextFormFieldWidget(
            validator: ValidationsUtils.isValidEmailAndRequired,
            controller: emailTEC,
            hintText: 'Enter your email',
            labelText: 'email',
            prefixIcon: Icon(
              FontAwesomeIcons.userLarge,
            ),
          ),
          SizedBox(
            height: 30,
          ),

          /// Password Section
          GlobalTextFormFieldWidget(
            validator: ValidationsUtils.isRequired,
            obscureText: isPwdTxtObscure,
            controller: passwordTEC,
            hintText: 'Enter your password',
            labelText: 'Password',
            prefixIcon: Icon(
              FontAwesomeIcons.lock,
            ),
            suffixIcon: isPwdTxtObscure
                ? IconButton(
                    icon: Icon(
                      FontAwesomeIcons.solidEye,
                    ),
                    onPressed: () {
                      setState(() {
                        isPwdTxtObscure = !isPwdTxtObscure;
                      });
                    })
                : IconButton(
                    icon: Icon(
                      FontAwesomeIcons.solidEyeSlash,
                    ),
                    onPressed: () {
                      setState(() {
                        isPwdTxtObscure = !isPwdTxtObscure;
                      });
                    }),
          ),
          SizedBox(
            height: 10,
          ),

          /// Remember me section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 24.0,
                    width: 24.0,
                    child: Checkbox(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.5,
                      ),
                      activeColor: Theme.of(context).colorScheme.primary,
                      value: isSaveCredentials,
                      onChanged: (newValue) {
                        setState(() {
                          isSaveCredentials = !isSaveCredentials;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      "Remember me",
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),

          /// Login Button
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
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
                    child: Text(
                      "Sign in",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                    onPressed: loginHandler,
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
