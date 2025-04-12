# Auth

Here is the documenting to sign in a user and sign out, you just gonna use what you need because this implementation start with something really siple and scale with that base.

The first point here is the package ```app_session``` this include a class called ```UserSession``` and this class has an attribute called ```user``` that is a ```User``` you can edit this class depending on your business login.

### Use Case

Image you are making a game and you just want to identify the user into the game, you don't want to save this user in the backend, just set a ```username``` and that's it.

```dart
final user = User(id: '1234', username: 'Wizard1234');

UserSession.instance.signIn(user);
```

The ```UserSession``` expose a ```stream``` where you can listen the changes of the user.

And then if you want to have public and private screens you can update this in the ```AppRouter``` in the method redirect.

```dart
class AppRouter {

    static const final publicRoutes = [
        SplashScreen.path,
        RegisterPlayerScreen.path,
        HomeScreen.path,
    ];

    RouterConfig<RouteMatchList> router = GoRouter(
        ...
        redirect: (context, state) {
            final route = state.fullPath;
            final realRedirectTo = state.uri.toString();

            final isAuth = UserSession.instance.check;
            final isPrivateRoute = !publicRoutes.contains(route);

            if (isPrivateRoute && !isAuth) {
                return RegisterPlayerScreen.path;
            }

            return realRedirectTo;
        },
    );
}
```

You can trigger the ```redirect``` method using the attribute ```refreshListenable``` to do it automatically. 

```dart
class TriggerRouter extends ChangeNotifier {
  TriggerRouter() {
    UserSession.instance.stream.addListener(() {
      notifyListeners();
    });
  }
}
```

Or if you want to have more control of this of when run the ```redirect``` you can use the method ```refresh``` of ```AppRouter``` 

### Installation

```bash
flutter pub add app_session --path=packages/app_session
```