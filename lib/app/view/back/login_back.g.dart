// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginBack on _LoginBack, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_LoginBack.isEmailValid'))
          .value;
  Computed<bool>? _$isPassValidComputed;

  @override
  bool get isPassValid =>
      (_$isPassValidComputed ??= Computed<bool>(() => super.isPassValid,
              name: '_LoginBack.isPassValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_LoginBack.isFormValid'))
          .value;
  Computed<bool>? _$isLogedComputed;

  @override
  bool get isLoged => (_$isLogedComputed ??=
          Computed<bool>(() => super.isLoged, name: '_LoginBack.isLoged'))
      .value;

  final _$ctxAtom = Atom(name: '_LoginBack.ctx');

  @override
  dynamic get ctx {
    _$ctxAtom.reportRead();
    return super.ctx;
  }

  @override
  set ctx(dynamic value) {
    _$ctxAtom.reportWrite(value, super.ctx, () {
      super.ctx = value;
    });
  }

  final _$emailAtom = Atom(name: '_LoginBack.email');

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

  final _$senhaAtom = Atom(name: '_LoginBack.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$passVisibleAtom = Atom(name: '_LoginBack.passVisible');

  @override
  bool get passVisible {
    _$passVisibleAtom.reportRead();
    return super.passVisible;
  }

  @override
  set passVisible(bool value) {
    _$passVisibleAtom.reportWrite(value, super.passVisible, () {
      super.passVisible = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginBack.loading');

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

  final _$loggedInAtom = Atom(name: '_LoginBack.loggedIn');

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

  final _$acessarAsyncAction = AsyncAction('_LoginBack.acessar');

  @override
  Future acessar([dynamic value]) {
    return _$acessarAsyncAction.run(() => super.acessar(value));
  }

  final _$_LoginBackActionController = ActionController(name: '_LoginBack');

  @override
  void getContext(BuildContext context) {
    final _$actionInfo =
        _$_LoginBackActionController.startAction(name: '_LoginBack.getContext');
    try {
      return super.getContext(context);
    } finally {
      _$_LoginBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_LoginBackActionController.startAction(name: '_LoginBack.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo =
        _$_LoginBackActionController.startAction(name: '_LoginBack.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_LoginBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePassVisible() {
    final _$actionInfo = _$_LoginBackActionController.startAction(
        name: '_LoginBack.togglePassVisible');
    try {
      return super.togglePassVisible();
    } finally {
      _$_LoginBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ctx: ${ctx},
email: ${email},
senha: ${senha},
passVisible: ${passVisible},
loading: ${loading},
loggedIn: ${loggedIn},
isEmailValid: ${isEmailValid},
isPassValid: ${isPassValid},
isFormValid: ${isFormValid},
isLoged: ${isLoged}
    ''';
  }
}
