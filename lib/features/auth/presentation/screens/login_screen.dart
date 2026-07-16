import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/providers/auth_notifier.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/providers/auth_remote_datasource_provider.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/providers/login/login_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage(name: "LoginScreen")
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context, ref),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(title: const Text("Login Screen"));
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Login Screen"),
        TextFormField(
          decoration: InputDecoration(labelText: "Email"),
          onChanged: (value) {
            ref.read(emailProvider.notifier).state = value;
          },
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Password"),
          onChanged: (value) {
            ref.read(passwordProvider.notifier).state = value;
          },
        ),
        ElevatedButton(
          onPressed: () {
            ref
                .read(authNotifierProvider.notifier)
                .login(
                  email: ref.read(emailProvider),
                  password: ref.read(passwordProvider),
                  loginUseCase: ref.read(loginUseCaseProvider),
                );
          },
          child: Text("Login"),
        ),
      ],
    );
  }
}
