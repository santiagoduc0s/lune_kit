import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState();

  const HomeState.initial();

  HomeState copyWith() {
    return const HomeState();
  }

  @override
  List<Object> get props => [];
}
