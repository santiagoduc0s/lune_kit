import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lune/extensions/extensions.dart';
import 'package:lune/features/sign_up/bloc/bloc.dart';
import 'package:lune/l10n/l10n.dart';
import 'package:lune/ui/widgets/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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

    final form = context.read<SignUpBloc>().form;

    final buttonsProvider = Theme.of(context).buttonStyles;
    final iconProvider = Theme.of(context).icons;
    final inputsProvider = Theme.of(context).inputStyles;

    final isSigningUp = context.select(
      (SignUpBloc bloc) => bloc.state.isSigningUp,
    );

    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.signUp),
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
                    child: iconProvider.logo(size: 34.space),
                  ),
                  SizedBox(height: 8.space),
                  ReactiveFormBuilder(
                    form: () => form,
                    builder: (context, form, child) {
                      return Column(
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
                          SizedBox(height: 4.space),
                          ReactivePasswordField(
                            formControlName: 'password',
                            textInputAction: TextInputAction.next,
                            decoration: inputsProvider.primary.copyWith(
                              labelText: l10n.password,
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
                      );
                    },
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
                      isLoading: isSigningUp,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        context
                            .read<SignUpBloc>()
                            .add(const SignUpWithEmailAndPassword());
                      },
                      style: buttonsProvider.primaryFilled,
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
