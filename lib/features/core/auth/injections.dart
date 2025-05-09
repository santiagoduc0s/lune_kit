import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/data/datasources/datasources.dart';
import 'package:lune/features/core/auth/data/repositories/repositories.dart';
import 'package:lune/features/core/auth/domain/repositories/repositories.dart';
import 'package:lune/features/core/auth/domain/usecases/usecases.dart';
import 'package:lune/features/core/auth/ui/notifiers/notifiers.dart';

Future<void> appPreferenceInjections() async {
  /// DATASOURCE
  Injector.registerSingleton<AuthDatasource>(
    AuthLocalDatasource(),
  );

  /// REPOSITORY
  Injector.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      datasource: Injector.findSingleton(),
    ),
  );

  /// USE CASES
  Injector.registerSingleton<DeleteUserUseCase>(
    DeleteUserUseCase(Injector.findSingleton()),
  );

  Injector.registerSingleton<ForgotPasswordUseCase>(
    ForgotPasswordUseCase(Injector.findSingleton()),
  );

  Injector.registerSingleton<SignInWithCredentialsUseCase>(
    SignInWithCredentialsUseCase(Injector.findSingleton()),
  );

  Injector.registerSingleton<SignInWithEmailPasswordUseCase>(
    SignInWithEmailPasswordUseCase(Injector.findSingleton()),
  );

  Injector.registerSingleton<SignOutUseCase>(
    SignOutUseCase(Injector.findSingleton()),
  );

  Injector.registerSingleton<SignUpUseCase>(
    SignUpUseCase(Injector.findSingleton()),
  );

  Injector.registerSingleton<UpdatePasswordUseCase>(
    UpdatePasswordUseCase(Injector.findSingleton()),
  );

  Injector.registerSingleton<UpdatePasswordUseCase>(
    UpdatePasswordUseCase(Injector.findSingleton()),
  );

  /// NOTIFIER
  Injector.registerSingleton<AuthNotifier>(
    AuthNotifier(
      router: Injector.findSingleton(),
    ),
  );
}
