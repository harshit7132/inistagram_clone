part of 'log_in_bloc.dart';

@immutable
class LogInState {
  final String email;
  final String password;
  const LogInState({this.password = "", this.email = ""});

  LogInState copyWith({String? email, String? password}) {
    return LogInState(
        email: email ?? this.email, password: password ?? this.password);
  }
}
