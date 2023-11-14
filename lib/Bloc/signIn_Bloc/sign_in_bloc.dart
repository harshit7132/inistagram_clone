import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<userNameEvent>(_usernameEvent);
    on<passwordEvent>(_passwordEvent);
    on<phoneEvent>(_phoneEvent);
  }
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _usernameEvent(userNameEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _passwordEvent(passwordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _phoneEvent(phoneEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(phone: event.phone));
  }
}
