import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../config/theme/theme.dart';
import '../bloc/authentication/auth_bloc.dart';

class RegisterAndLoginScreen extends StatelessWidget {
  const RegisterAndLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthConfirmationDone) {
              return const Center(child: Text('You\'ve Logged In!'),);
            } else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Lottie.asset(
                    'assets/animation/avatar.json',
                    width: 200,
                    height: 200,
                    repeat: false,
                    animate: false,
                    onLoaded: (p0) {},
                  ),

                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      var bloc = BlocProvider.of<AuthBloc>(context);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: bloc.phoneController,
                          textInputAction: TextInputAction.next,
                          readOnly: ((state is AuthSendingCodeDone) || (state is AuthSendCodeLoading)) ? true : false,
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.phone,
                          decoration: defTextFieldDecoration().copyWith(hintText: 'Phone Number:'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      var bloc = BlocProvider.of<AuthBloc>(context);
                      if (state is AuthSendingCodeDone) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextField(
                            controller: bloc.codeController,
                            focusNode: bloc.codeFocusNode,
                            textInputAction: TextInputAction.next,
                            style: const TextStyle(color: Colors.white),
                            keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
                            decoration: defTextFieldDecoration().copyWith(hintText: 'Registration Code:'),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      var bloc = BlocProvider.of<AuthBloc>(context);
                      return ElevatedButton(
                        onPressed: () {
                          if (state is! AuthSendingCodeDone) {
                            bloc.add(const AuthSendCodeEvent());
                          } else {
                            bloc.add(const AuthConfirmCodeEvent());
                          }
                        },
                        child: btnChild(context, state),
                      );
                    },
                  ),
                  const SizedBox(height: 100,)
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget btnChild(BuildContext context, AuthState state) {
    if (state is AuthSendCodeLoading || state is AuthConfirmationLoading) {
      return const Text('Please Wait');
    }
    if (state is AuthSendingCodeDone) {
      return const Text('Confirm');
    } else {
      return const Text('Send Code');
    }
  }
}
