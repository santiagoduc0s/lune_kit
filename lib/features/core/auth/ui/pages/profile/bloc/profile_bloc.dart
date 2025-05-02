import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lune/application/auth/repositories/repositories.dart';
import 'package:lune/application/storage/repositories/repositories.dart';
import 'package:lune/domain/auth/requests/requests.dart';
import 'package:lune/domain/storage/requests/requests.dart';
import 'package:lune/features/profile/bloc/bloc.dart';
import 'package:lune/helpers/alerts/alerts.dart';
import 'package:lune/helpers/permission_helper.dart';
import 'package:lune/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required this.storageRepository,
    required this.authRepository,
    required String? imageUser,
    required String initials,
  }) : super(
          ProfileState.initial(
            imageUser: imageUser,
            initials: initials,
          ),
        ) {
    on<ProfileUpdate>(_onProfileUpdate);
    on<UpdateUserProfilePhoto>(_onUpdateUserProfilePhoto);
    on<DeleteUserProfilePhoto>(_onDeleteUserProfilePhoto);
    on<UpdateInitials>(_onUpdateInitials);
    on<UpdateImageUser>(_onUpdateImageUser);
  }

  final StorageRepository storageRepository;
  final AuthRepository authRepository;

  final FormGroup form = FormGroup(
    {
      'firstName': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
      'lastName': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
      'email': FormControl<String>(
        value: '',
        disabled: true,
      ),
    },
  );

  void init() {
    final user = UserAuthSession.instance.user!;

    form.control('firstName').value = user.firstName;
    form.control('lastName').value = user.lastName;
    form.control('email').value = user.email;
  }

  Future<void> _onProfileUpdate(
    ProfileUpdate event,
    Emitter<ProfileState> emit,
  ) async {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    if (state.isUpdatingData) return;

    emit(state.copyWith(isUpdatingData: true));

    try {
      final user = await authRepository.updateUser(
        UpdateUserRequestBody(
          id: UserAuthSession.instance.user!.id,
          firstName: form.control('firstName').value as String,
          lastName: form.control('lastName').value as String,
        ),
      );

      UserAuthSession.instance.setUser(user);

      add(UpdateInitials());

      CustomSnackbar.instance.info(
        text: Localization.instance.tr.profile_userUpdated,
      );
    } catch (e, s) {
      CustomSnackbar.instance.error(
        text: Localization.instance.tr.generalError,
      );
      AppLogger.instance.error(e.toString(), stackTrace: s);
    } finally {
      emit(state.copyWith(isUpdatingData: false));
    }
  }

  Future<void> _onUpdateUserProfilePhoto(
    UpdateUserProfilePhoto event,
    Emitter<ProfileState> emit,
  ) async {
    if (state.isUpdatingPhoto) return;

    emit(state.copyWith(isUpdatingPhoto: true));

    try {
      final hasPermission = await PermissionHelper.instance.requestPermission(
        permission: Permission.camera,
        title: Localization.instance.tr.camera,
        message: Localization.instance.tr.profile_messageActivePermission,
        showRequiredDialog: true,
      );

      if (!hasPermission) return;

      final image = await ImagePicker().pickImage(
        source: event.source,
        maxWidth: 400,
      );

      if (image == null) return;

      final user = UserAuthSession.instance.user!;

      if (user.photo != null) {
        await storageRepository.deleteFile(
          DeleteFileRequestBody(
            path: user.photo!,
          ),
        );
      }

      final filename =
          '/users/${user.id}/profile/${DateTime.now().millisecondsSinceEpoch}.jpg';

      await storageRepository.saveFile(
        SaveFileRequestBody(
          file: await image.readAsBytes(),
          path: filename,
        ),
      );

      final updatedUser = await authRepository.updateUser(
        UpdateUserRequestBody(
          id: user.id,
          photo: Parameter(filename),
        ),
      );

      UserAuthSession.instance.setUser(updatedUser);

      add(UpdateImageUser());

      CustomSnackbar.instance.info(
        text: Localization.instance.tr.profile_imageUpdated,
      );
    } catch (e, s) {
      CustomSnackbar.instance.error(
        text: Localization.instance.tr.generalError,
      );
      AppLogger.instance.error(e.toString(), stackTrace: s);
    } finally {
      emit(state.copyWith(isUpdatingPhoto: false));
    }
  }

  Future<void> _onDeleteUserProfilePhoto(
    DeleteUserProfilePhoto event,
    Emitter<ProfileState> emit,
  ) async {
    if (state.isUpdatingPhoto) return;

    emit(state.copyWith(isUpdatingPhoto: true));

    try {
      final user = UserAuthSession.instance.user!;

      if (user.photo == null) return;

      await storageRepository.deleteFile(
        DeleteFileRequestBody(
          path: user.photo!,
        ),
      );

      final updatedUser = await authRepository.updateUser(
        UpdateUserRequestBody(
          id: user.id,
          photo: const Parameter(null),
        ),
      );

      UserAuthSession.instance.setUser(updatedUser);

      add(UpdateImageUser());

      CustomSnackbar.instance.info(
        text: Localization.instance.tr.profile_imageDeleted,
      );
    } catch (e, s) {
      CustomSnackbar.instance.error(
        text: Localization.instance.tr.generalError,
      );

      AppLogger.instance.error(e.toString(), stackTrace: s);
    } finally {
      emit(state.copyWith(isUpdatingPhoto: false));
    }
  }

  Future<void> _onUpdateInitials(
    UpdateInitials event,
    Emitter<ProfileState> emit,
  ) async {
    final user = UserAuthSession.instance.user!;

    final firstName = user.firstName ?? '';
    final lastName = user.lastName ?? '';

    final nameWasSet = firstName.isNotEmpty && lastName.isNotEmpty;

    if (!nameWasSet) return;

    final initials = '${firstName[0]}${lastName[0]}'.toUpperCase();

    emit(state.copyWith(initials: initials));
  }

  Future<void> _onUpdateImageUser(
    UpdateImageUser event,
    Emitter<ProfileState> emit,
  ) async {
    final user = UserAuthSession.instance.user!;

    final photo = user.photo;

    emit(state.copyWith(imageUser: Parameter(photo)));
  }
}
