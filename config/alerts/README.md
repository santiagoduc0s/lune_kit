# AppSnackbar

The ```AppSnackbar``` can show an ```SnackBar```

## Example

```dart
Injector.findSingleton<AppSnackbar>().show(
    (context) => Snackbars.error(
        context,
        text: '',
    ),
);
```

# AppDialog

The ```AppDialog``` can show an ```AlertDialog```

## Example

```dart
Injector.findSingleton<AppDialog>().confirm(
    dialog: (context) => Dialogs.confirm(
        context,
        message: '',
        confirmText: '',
        cancelText: '',
    ),
);
```