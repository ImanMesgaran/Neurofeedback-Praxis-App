part of 'login_cubit.dart';

class LoginState {
  final int id;

  LoginState({
    required this.id,
  });

  factory LoginState.initial() {
    return LoginState(
      id: 0,
    );
  }
}
