import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lune/extensions/extensions.dart';
import 'package:lune/features/sign_in/bloc/bloc.dart';
import 'package:lune/l10n/l10n.dart';
import 'package:lune/ui/widgets/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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

    final form = context.read<SignInBloc>().form;

    final buttonsProvider = Theme.of(context).buttonStyles;
    final iconProvider = Theme.of(context).icons;
    final inputsProvider = Theme.of(context).inputStyles;

    final isSingingWithEmailAndPassword = context.select(
      (SignInBloc bloc) => bloc.state.isSingingWithEmailAndPassword,
    );

    final l10n = context.l10n;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.space,
              ),
              child: Column(
                children: [
                  SizedBox(height: topPadding),
                  SizedBox(height: 8.space),
                  Hero(
                    tag: 'logo',
                    child: iconProvider.logo(size: 50.space),
                  ),
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
                              onPressed: () {
                                context
                                    .read<SignInBloc>()
                                    .add(ForgotPassword());
                              },
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
                            .read<SignInBloc>()
                            .add(SignInWithEmailAndPassword());
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
                        context.read<SignInBloc>().add(SignUpAccount());
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
