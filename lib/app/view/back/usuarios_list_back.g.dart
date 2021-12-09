// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuarios_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsuarioListBack on _UsuarioListBack, Store {
  final _$listAtom = Atom(name: '_UsuarioListBack.list');

  @override
  Future<List<Usuario>>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Usuario>>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_UsuarioListBackActionController =
      ActionController(name: '_UsuarioListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_UsuarioListBackActionController.startAction(
        name: '_UsuarioListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_UsuarioListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
