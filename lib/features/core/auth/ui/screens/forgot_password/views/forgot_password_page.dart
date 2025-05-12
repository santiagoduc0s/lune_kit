import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/ui/spacing/spacing.dart';
import 'package:lune/core/ui/widgets/widgets.dart';
import 'package:lune/features/core/auth/ui/screens/forgot_password/notifiers/notifiers.dart';
import 'package:lune/l10n/l10n.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomPadding = MediaQuery.of(context).padding.bottom;
    if (bottomPadding == 0) {
      bottomPadding = 4.space;
    }

    final form = context.read<ForgotPasswordNotifier>().form;

    final buttonsProvider = context.buttonStyles;
    final iconProvider = context.icons;
    final inputsProvider = context.inputStyles;

    final isSendingEmail =
        context.watch<ForgotPasswordNotifier>().isSendingEmail;

    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.forgotPassword_title),
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
                  SizedBox(height: 8.space),
                  Hero(
                    tag: 'logo',
                    child: iconProvider.logo(size: 40.space),
                  ),
                  SizedBox(height: 4.space),
                  ReactiveForm(
                    formGroup: form,
                    child: Column(
                      children: [
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
                      isLoading: isSendingEmail,
                      onPressed: () {
                        FocusScope.of(context).unfocus();

                        context
                            .read<ForgotPasswordNotifier>()
                            .sendForgotPasswordEmail();
                      },
                      style: buttonsProvider.primaryFilled,
                      child: Text(l10n.send),
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
