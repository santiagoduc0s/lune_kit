sealed class SignInEvent {}

class SignInWithEmailAndPassword extends SignInEvent {
  SignInWithEmailAndPassword();
}

class SignUpAccount extends SignInEvent {
  SignUpAccount();
}

class ForgotPassword extends SignInEvent {
  ForgotPassword();
}
