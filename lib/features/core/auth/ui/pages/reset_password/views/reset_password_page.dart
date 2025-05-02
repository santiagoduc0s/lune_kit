import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lune/extensions/extensions.dart';
import 'package:lune/features/reset_password/bloc/bloc.dart';
import 'package:lune/l10n/l10n.dart';
import 'package:lune/ui/widgets/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomPadding = MediaQuery.of(context).padding.bottom;
    if (bottomPadding == 0) {
      bottomPadding = 4.space;
    }

    final form = context.read<ResetPasswordBloc>().form;

    final buttonsProvider = Theme.of(context).buttonStyles;
    final inputsProvider = Theme.of(context).inputStyles;

    final isResetPassword = context.select(
      (ResetPasswordBloc bloc) => bloc.state.isResetPassword,
    );

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
                  SizedBox(height: 4.space),
                  ReactiveForm(
                    formGroup: form,
                    child: Column(
                      children: [
                        ReactivePasswordField(
                          formControlName: 'password',
                          textInputAction: TextInputAction.next,
                          decoration: inputsProvider.primary.copyWith(
                            labelText: l10n.password,
                          ),
                        ),
                        SizedBox(height: 4.space),
                        ReactivePasswordField(
                          formControlName: 'newPassword',
                          textInputAction: TextInputAction.next,
                          decoration: inputsProvider.primary.copyWith(
                            labelText: l10n.settings_newPassword,
                          ),
                        ),
                        SizedBox(height: 4.space),
                        ReactivePasswordField(
                          formControlName: 'repeatPassword',
                          textInputAction: TextInputAction.done,
                          decoration: inputsProvider.primary.copyWith(
                            labelText: l10n.repeatPassword,
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
                      isLoading: isResetPassword,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        context
                            .read<ResetPasswordBloc>()
                            .add(SubmitResetPassword());
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
