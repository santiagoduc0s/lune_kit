import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  const SignInState({
    required this.isSingingWithEmailAndPassword,
  });

  const SignInState.initial({
    this.isSingingWithEmailAndPassword = false,
  });

  final bool isSingingWithEmailAndPassword;

  SignInState copyWith({
    bool? isSingingWithEmailAndPassword,
  }) {
    return SignInState(
      isSingingWithEmailAndPassword:
          isSingingWithEmailAndPassword ?? this.isSingingWithEmailAndPassword,
    );
  }

  @override
  List<Object> get props => [
        isSingingWithEmailAndPassword,
      ];
}
