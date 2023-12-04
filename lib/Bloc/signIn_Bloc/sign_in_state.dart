part of 'sign_in_bloc.dart';

@immutable
class SignInState {
  final String email;
  final String username;
  final String fullname;
  final String password;
  final String phone;
  const SignInState({
    this.email = '',
    this.username = '',
    this.fullname = '',
    this.password = '',
    this.phone = '',
  });
  SignInState copyWith(
      {String? email,
      String? username,
      String? password,
      String? phone,
      String? fullname}) {
    return SignInState(
        email: email ?? this.email,
        username: username ?? this.username,
        fullname: fullname ?? this.fullname,
        password: password ?? this.password,
        phone: phone ?? this.phone);
  }
}
