import 'package:flutter/material.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/form/fields/fields.dart';
import 'package:lune/core/ui/spacing/spacing.dart';
import 'package:lune/core/ui/widgets/widgets.dart';
import 'package:lune/l10n/l10n.dart';
import 'package:lune/ui/sign_in/notifiers/notifiers.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomPadding = MediaQuery.of(context).padding.bottom;
    if (bottomPadding == 0) {
      bottomPadding = 4.space;
    }

    final form = context.read<SignInNotifier>().form;

    final buttonsProvider = context.buttonStyles;
    final inputsProvider = context.inputStyles;

    final isSingingWithEmailAndPassword = context.select(
      (SignInNotifier notifier) => notifier.isSigningIn,
    );

    final l10n = context.l10n;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(l10n.signIn),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.space,
              ),
              child: Column(
                children: [
                  SizedBox(height: 8.space),
                  ReactiveForm(
                    formGroup: form,
                    child: Column(
                      children: [
                        ReactiveTextField<String>(
                          keyboardType: TextInputType.emailAddress,
                          formControlName: 'email',
                          textInputAction: TextInputAction.next,
                          decoration: inputsProvider.primary.copyWith(
                            labelText: l10n.email,
                          ),
                        ),
                        SizedBox(height: 4.space),
                        ReactivePasswordField(
                          formControlName: 'password',
                          textInputAction: TextInputAction.done,
                          decoration: inputsProvider.primary.copyWith(
                            labelText: l10n.password,
                          ),
                        ),
                        SizedBox(height: 4.space),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: Text(l10n.forgotMyPassword),
                              onPressed: () => context
                                  .read<SignInNotifier>()
                                  .goToForgotPassword(),
                            ),
                          ],
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
                      isLoading: isSingingWithEmailAndPassword,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        context
                            .read<SignInNotifier>()
                            .signInWithEmailAndPassword();
                      },
                      style: buttonsProvider.primaryFilled,
                      child: Text(l10n.signIn),
                    ),
                  ),
                  SizedBox(height: 4.space),
                  SizedBox(
                    width: UISpacing.infinity,
                    child: LoadingButton(
                      type: ButtonType.outlined,
                      onPressed: () {
                        context.read<SignInNotifier>().goToSignUp();
                      },
                      style: buttonsProvider.primaryOutlined,
                      child: Text(l10n.signUp),
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
