import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/ui/ui.dart';
import 'package:lune/features/core/auth/ui/pages/profile/notifiers/notifiers.dart';
import 'package:lune/l10n/l10n.dart';
import 'package:provider/provider.dart';
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

    final form = context.read<ProfileNotifier>().form;

    final buttonsProvider = context.buttonStyles;
    final inputsProvider = context.inputStyles;
    final textsProvider = context.textStyles;
    final colorsProvider = context.colors;

    final isUpdatingData = context.select(
      (ProfileNotifier notifier) => notifier.isUpdatingData,
    );

    final isUpdatingPhoto = context.select(
      (ProfileNotifier notifier) => notifier.isUpdatingPhoto,
    );

    final user = context.select(
      (ProfileNotifier notifier) => notifier.user,
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
                          child: user.photo != null
                              ? ClipOval(
                                  child: Image.asset(
                                    user.photo!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                )
                              : user.initials.isNotEmpty
                                  ? Center(
                                      child: Text(
                                        user.initials,
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
                            if (user.photo != null)
                              PopupMenuItem(
                                value: 'delete',
                                child: Text(l10n.deletePicture),
                              ),
                          ],
                          onSelected: (value) async {
                            if (value is ImageSource) {
                              /// ...
                            }

                            if (value == 'delete') {
                              /// ...
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
                        context.read<ProfileNotifier>().updateProfile();
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
