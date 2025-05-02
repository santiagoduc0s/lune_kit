import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lune/extensions/extensions.dart';
import 'package:lune/features/profile/bloc/bloc.dart';
import 'package:lune/l10n/l10n.dart';
import 'package:lune/ui/ui.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomPadding = MediaQuery.of(context).padding.bottom;
    if (bottomPadding == 0) {
      bottomPadding = 4.space;
    }

    var topPadding = MediaQuery.of(context).padding.top;
    if (topPadding == 0) {
      topPadding = 4.space;
    }

    final form = context.read<ProfileBloc>().form;

    final buttonsProvider = Theme.of(context).buttonStyles;
    final inputsProvider = Theme.of(context).inputStyles;
    final textsProvider = Theme.of(context).textStyles;
    final colorsProvider = Theme.of(context).colors;

    final isUpdatingData = context.select(
      (ProfileBloc bloc) => bloc.state.isUpdatingData,
    );

    final isUpdatingPhoto = context.select(
      (ProfileBloc bloc) => bloc.state.isUpdatingPhoto,
    );

    final imageUser = context.select(
      (ProfileBloc bloc) => bloc.state.imageUser,
    );

    final initials = context.select(
      (ProfileBloc bloc) => bloc.state.initials,
    );

    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profile),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.space,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 30.space,
                        height: 30.space,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorsProvider.primaryContainer,
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (
                            Widget child,
                            Animation<double> animation,
                          ) {
                            return FadeTransition(
                              opacity: animation,
                              child: ScaleTransition(
                                scale: animation,
                                child: child,
                              ),
                            );
                          },
                          child: imageUser != null
                              ? ClipOval(
                                  child: Image.asset(
                                    imageUser,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                )
                              : initials.isNotEmpty
                                  ? Center(
                                      child: Text(
                                        initials,
                                        style: textsProvider.headlineLarge,
                                      ),
                                    )
                                  : Center(
                                      child: Icon(
                                        Icons.person,
                                        size: 15.space,
                                      ),
                                    ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: PopupMenuButton(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.circular(
                            10.space,
                          ),
                          color: colorsProvider.surface,
                          padding: EdgeInsets.zero,
                          menuPadding: EdgeInsets.zero,
                          offset: Offset(
                            -2.space,
                            2.space,
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: ImageSource.gallery,
                              child: Text(l10n.gallery),
                            ),
                            PopupMenuItem(
                              value: ImageSource.camera,
                              child: Text(l10n.takePicture),
                            ),
                            if (imageUser != null)
                              PopupMenuItem(
                                value: 'delete',
                                child: Text(l10n.deletePicture),
                              ),
                          ],
                          onSelected: (value) async {
                            if (value is ImageSource) {
                              context
                                  .read<ProfileBloc>()
                                  .add(UpdateUserProfilePhoto(source: value));
                            }

                            if (value == 'delete') {
                              context
                                  .read<ProfileBloc>()
                                  .add(DeleteUserProfilePhoto());
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: colorsProvider.onPrimary,
                                width: 0.5.space,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 5.space,
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                transitionBuilder: (
                                  Widget child,
                                  Animation<double> animation,
                                ) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: ScaleTransition(
                                      scale: animation,
                                      child: child,
                                    ),
                                  );
                                },
                                child: isUpdatingPhoto
                                    ? SizedBox(
                                        height: 5.space,
                                        width: 5.space,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 0.5.space,
                                        ),
                                      )
                                    : Icon(
                                        Icons.edit,
                                        size: 5.space,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.space),
                  ReactiveForm(
                    formGroup: form,
                    child: Column(
                      children: [
                        ReactiveTextField<String>(
                          formControlName: 'firstName',
                          textInputAction: TextInputAction.next,
                          decoration: inputsProvider.primary.copyWith(
                            labelText: l10n.firstName,
                          ),
                        ),
                        SizedBox(height: 4.space),
                        ReactiveTextField<String>(
                          formControlName: 'lastName',
                          textInputAction: TextInputAction.next,
                          decoration: inputsProvider.primary.copyWith(
                            labelText: l10n.lastName,
                          ),
                        ),
                        SizedBox(height: 4.space),
                        ReactiveTextField<String>(
                          keyboardType: TextInputType.emailAddress,
                          formControlName: 'email',
                          textInputAction: TextInputAction.next,
                          decoration: inputsProvider.primary.copyWith(
                            labelText: l10n.email,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 4.space,
                right: 4.space,
                top: 4.space,
                bottom: bottomPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: UISpacing.infinity,
                    child: LoadingButton(
                      type: ButtonType.filled,
                      isLoading: isUpdatingData,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        context.read<ProfileBloc>().add(ProfileUpdate());
                      },
                      style: buttonsProvider.primaryFilled,
                      child: Text(l10n.save),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
