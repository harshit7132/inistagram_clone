part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class EmailEvent extends SignInEvent {
  final String email;
  EmailEvent(this.email);
}

class userNameEvent extends SignInEvent {
  final String username;
  userNameEvent(this.username);
}

class passwordEvent extends SignInEvent {
  final String password;
  passwordEvent(this.password);
}

class phoneEvent extends SignInEvent {
  final String phone;
  phoneEvent(this.phone);
}
