# Public Onboard

### How to use?

1. Add the ```PublicOnboardScreen.route()``` to the ```AppRouter.router```

### Recommendation

You can manage your own logic of when show this screen but I recommend to navigate to this screen after the splash screen, manage the logic here ```lib/features/splash/bloc/splash_bloc.dart```.

Example:

In the ```_onSplashInit``` you can add

```dart
if (PublicOnboardManager.getPublicOnboardStatus() ==
    PublicOnboardStatus.unseen) {
    AppRouter.instance.goNamed(PublicOnboardScreen.path);
} else {
    AppRouter.instance.goNamed(HomeScreen.path);
}
```

And in the ```lib/features/public_onboard/bloc/public_onboard_bloc.dart``` after finish the onboard, update the ```_onFinishPublicOnboard```

```dart
void _onFinishPublicOnboard(
    FinishPublicOnboard event,
    Emitter<PublicOnboardState> emit,
) {
    PublicOnboardManager.setPublicOnboardStatus(
        PublicOnboardStatus.seen,
    );

    AppRouter.instance.goNamed(HomeScreen.path);
}
```

