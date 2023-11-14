part of 'sign_in_bloc.dart';

@immutable
class SignInState {
  final String email;
  final String username;
  final String password;
  final String phone;
  const SignInState({
    this.email = '',
    this.username = '',
    this.password = '',
    this.phone = '',
  });
  SignInState copyWith(
      {String? email, String? username, String? password, String? phone}) {
    return SignInState(
        email: email ?? this.email,
        username: username ?? this.username,
        password: password ?? this.password,
        phone: phone ?? this.phone);
  }
}
