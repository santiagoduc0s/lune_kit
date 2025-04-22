# Auth

This documentation explains how to sign in and sign out a user. You can use only the parts you need, as this implementation is designed to be simple and flexible.

### Overview

The main package used here is `app_session`, which includes a class called `UserSessionExample`. This class implements the `SessionMixin`, which provides an attribute called `user`. The `user` is an instance of the `User` class, and you can extend this class to customize it for your business logic.

### Use Case

Imagine you are building a game and want to identify the user within the game. You don’t need to save this user in the backend—just set a `name`, and that’s it.

Here’s an example:

```dart
final user = UserExample(id: '1234', name: 'Wizard1234');

UserSessionExample.instance.signIn(user);
```

The `UserSessionExample` exposes a `stream` that allows you to listen for changes to the user.

### Public and Private Screens

To manage public and private screens, you can update the `AppRouter` class in the `redirect` method. Here’s an example:

```dart
class AppRouter {
  static const publicRoutes = [
    SplashScreen.path,
    RegisterPlayerScreen.path,
    HomeScreen.path,
  ];

  RouterConfig<RouteMatchList> router = GoRouter(
    ...
    redirect: (context, state) {
      final route = state.fullPath;
      final realRedirectTo = state.uri.toString();

      final isSignedIn = UserSessionExample.instance.isSignedIn;
      final isPrivateRoute = !publicRoutes.contains(route);

      if (isPrivateRoute && !isSignedIn) {
        return RegisterPlayerScreen.path;
      }

      return realRedirectTo;
    },
  );
}
```

### Triggering Redirects

You can trigger the `redirect` method automatically using the `refreshListenable` attribute. Here’s how:

```dart
class TriggerRouter extends ChangeNotifier {
  TriggerRouter() {
    UserSession.instance.stream.addListener(() {
      notifyListeners();
    });
  }
}
```

Alternatively, if you want more control over when the `redirect` method is executed, you can use the `refresh` method of the `AppRouter` class.