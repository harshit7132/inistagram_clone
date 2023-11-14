part of 'log_in_bloc.dart';

@immutable
abstract class LogInEvent {}

class EmailEvent extends LogInEvent {
  final String email;
  EmailEvent(this.email);
}

class PasswordEvent extends LogInEvent {
  final String password;
  PasswordEvent(this.password);
}
