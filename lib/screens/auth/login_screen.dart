import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xyz_cart/providers/auth_provider.dart';
import 'package:xyz_cart/providers/loadin_provider.dart';
import 'package:xyz_cart/screens/auth/view_model.dart';
import 'package:xyz_cart/utils/app_texts.dart';
import 'package:xyz_cart/utils/constants.dart';
import 'package:xyz_cart/utils/index.dart';
import 'package:xyz_cart/widgets/custom_input_field.dart';
import 'package:xyz_cart/widgets/main_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginDelegate {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late LoadinProvider _loadingProvider;
  late AuthProvider _authProvider;
  final _key = GlobalKey<FormState>();
  late ViewModel _viewModel;
  @override
  void initState() {
    _loadingProvider = Provider.of<LoadinProvider>(context, listen: false);
    _authProvider = Provider.of<AuthProvider>(context, listen: false);
    _viewModel = ViewModel(
        lDelegate: this, lProvider: _loadingProvider, aProvider: _authProvider);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainContainer(
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kToolbarHeight,
              ),
              Container(
                width: 65,
                height: 65,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(
                    defaultRadius,
                  ),
                ),
                child: Text(
                  "E",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: secondaryColor),
                ),
              ),
              const SizedBox(
                height: kToolbarHeight,
              ),
              Text(
                welcomeTextLoginScreen,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Text(
                subTitleLoginScreen,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              CustomInputField(
                hint: userNamePlaceHolderLoginScreen,
                label: userNameLabelLoginScreen,
                controller: _emailController,
                validatingMessage: "Email is required",
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              CustomInputField(
                hint: passswordPlaceHolderLoginScreen,
                label: passwordLabelLoginScreen,
                controller: _passwordController,
                validatingMessage: "Password is required",
              ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              MaterialButton(
                color: primaryColor,
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () async {
                  // _emailController.text = "qaapp2@yopmail.com";
                  // _passwordController.text = "12345678";
                  if (_key.currentState!.validate()) {
                    _viewModel.email = _emailController.text;
                    _viewModel.password = _passwordController.text;
                    await _viewModel.handleLoginButtonPress();
                  }
                },
                child: const Text(logginButtonText),
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    donthaveAnAcountTextLoginScreen,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(signupTexLoginScreen),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void showSnackbar(String? message,
      [Function? completion, Duration duration = const Duration(seconds: 4)]) {
    context.showSnackBar(message);
  }
}
