import 'package:lune/domain/usecases/usecases.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerUseCases = [
  // Auth Use Cases
  ...[
    Provider<SignInWithEmailPasswordUseCase>(
      create: (context) => SignInWithEmailPasswordUseCase(
        context.read(),
      ),
    ),
    Provider<SignUpUseCase>(
      create: (context) => SignUpUseCase(
        context.read(),
      ),
    ),
    Provider<ForgotPasswordUseCase>(
      create: (context) => ForgotPasswordUseCase(
        context.read(),
      ),
    ),
    Provider<UpdatePasswordUseCase>(
      create: (context) => UpdatePasswordUseCase(
        context.read(),
      ),
    ),
  ],

  // Device Use Cases
  ...[
    Provider<DeleteDeviceUseCase>(
      create: (context) => DeleteDeviceUseCase(
        context.read(),
      ),
    ),
    Provider<GetDeviceUseCase>(
      create: (context) => GetDeviceUseCase(
        context.read(),
      ),
    ),
  ],

  // Messaging Use Cases
  ...[
    Provider<SaveTokenUseCase>(
      create: (context) => SaveTokenUseCase(
        messagingRepository: context.read(),
        deviceRepository: context.read(),
      ),
    ),
  ],

  // Permission Use Cases
  ...[
    Provider<CheckPermissionUseCase>(
      create: (context) => CheckPermissionUseCase(
        context.read(),
      ),
    ),
    Provider<OpenSettingsUseCase>(
      create: (context) => OpenSettingsUseCase(
        context.read(),
      ),
    ),
    Provider<RequestPermissionUseCase>(
      create: (context) => RequestPermissionUseCase(
        context.read(),
      ),
    ),
  ],

  // Preference Use Cases
  ...[
    Provider<GetPreferenceUseCase>(
      create: (context) => GetPreferenceUseCase(
        preferenceRepository: context.read(),
      ),
    ),
    Provider<UpdatePreferenceUseCase>(
      create: (context) => UpdatePreferenceUseCase(
        preferenceRepository: context.read(),
      ),
    ),
  ],

  // Public Onboard Use Cases
  ...[
    Provider<GetPublicOnboardStatusUseCase>(
      create: (context) => GetPublicOnboardStatusUseCase(
        context.read(),
      ),
    ),
    Provider<SetPublicOnboardStatusUseCase>(
      create: (context) => SetPublicOnboardStatusUseCase(
        context.read(),
      ),
    ),
  ],
];
