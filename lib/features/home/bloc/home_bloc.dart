import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lune/features/home/home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial());
}
