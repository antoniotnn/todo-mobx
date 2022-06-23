// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  Computed<Color>? _$emailFieldColorToApplyComputed;

  @override
  Color get emailFieldColorToApply => (_$emailFieldColorToApplyComputed ??=
          Computed<Color>(() => super.emailFieldColorToApply,
              name: '_LoginStore.emailFieldColorToApply'))
      .value;
  Computed<Color>? _$passwordFieldColorToApplyComputed;

  @override
  Color get passwordFieldColorToApply =>
      (_$passwordFieldColorToApplyComputed ??= Computed<Color>(
              () => super.passwordFieldColorToApply,
              name: '_LoginStore.passwordFieldColorToApply'))
          .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_LoginStore.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_LoginStore.isPasswordValid'))
          .value;
  Computed<VoidCallback?>? _$loginPressedComputed;

  @override
  VoidCallback? get loginPressed => (_$loginPressedComputed ??=
          Computed<VoidCallback?>(() => super.loginPressed,
              name: '_LoginStore.loginPressed'))
      .value;

  late final _$emailFieldColorAtom =
      Atom(name: '_LoginStore.emailFieldColor', context: context);

  @override
  Color get emailFieldColor {
    _$emailFieldColorAtom.reportRead();
    return super.emailFieldColor;
  }

  @override
  set emailFieldColor(Color value) {
    _$emailFieldColorAtom.reportWrite(value, super.emailFieldColor, () {
      super.emailFieldColor = value;
    });
  }

  late final _$passwordFieldColorAtom =
      Atom(name: '_LoginStore.passwordFieldColor', context: context);

  @override
  Color get passwordFieldColor {
    _$passwordFieldColorAtom.reportRead();
    return super.passwordFieldColor;
  }

  @override
  set passwordFieldColor(Color value) {
    _$passwordFieldColorAtom.reportWrite(value, super.passwordFieldColor, () {
      super.passwordFieldColor = value;
    });
  }

  late final _$emailAtom = Atom(name: '_LoginStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordVisibleAtom =
      Atom(name: '_LoginStore.passwordVisible', context: context);

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_LoginStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$loggedInAtom =
      Atom(name: '_LoginStore.loggedIn', context: context);

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  late final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore', context: context);

  @override
  void setEmailFieldColor(Color color) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setEmailFieldColor');
    try {
      return super.setEmailFieldColor(color);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordFieldColor(Color color) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setPasswordFieldColor');
    try {
      return super.setPasswordFieldColor(color);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tooglePasswordVisibillity() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.tooglePasswordVisibillity');
    try {
      return super.tooglePasswordVisibillity();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.logout');
    try {
      return super.logout();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailFieldColor: ${emailFieldColor},
passwordFieldColor: ${passwordFieldColor},
email: ${email},
password: ${password},
passwordVisible: ${passwordVisible},
loading: ${loading},
loggedIn: ${loggedIn},
emailFieldColorToApply: ${emailFieldColorToApply},
passwordFieldColorToApply: ${passwordFieldColorToApply},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
loginPressed: ${loginPressed}
    ''';
  }
}
