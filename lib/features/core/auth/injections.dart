import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/data/datasources/datasources.dart';
import 'package:lune/features/core/auth/data/repositories/repositories.dart';
import 'package:lune/features/core/auth/domain/repositories/repositories.dart';
import 'package:lune/features/core/auth/domain/usecases/usecases.dart';
import 'package:lune/features/core/auth/ui/notifiers/notifiers.dart';

Future<void> authInjections() async {
  /// DATASOURCE
  Injector.registerSingleton<AuthDatasource>(
    AuthDevDatasource(),
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

  Injector.registerSingleton<GetCurrentSessionUseCase>(
    GetCurrentSessionUseCase(Injector.findSingleton()),
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

  Injector.registerSingleton<UpdateProfileUseCase>(
    UpdateProfileUseCase(Injector.findSingleton()),
  );

  /// NOTIFIER
  final authNotifier = AuthNotifier(
    router: Injector.findSingleton(),
    getCurrentSessionUseCase: Injector.findSingleton(),
  );

  await authNotifier.initialize();

  Injector.registerSingleton<AuthNotifier>(
    authNotifier,
  );
}
