// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InfoStore on _InfoStore, Store {
  late final _$infosAtom = Atom(name: '_InfoStore.infos', context: context);

  @override
  ObservableList<InfoEntity> get infos {
    _$infosAtom.reportRead();
    return super.infos;
  }

  @override
  set infos(ObservableList<InfoEntity> value) {
    _$infosAtom.reportWrite(value, super.infos, () {
      super.infos = value;
    });
  }

  late final _$editingInfoAtom =
      Atom(name: '_InfoStore.editingInfo', context: context);

  @override
  InfoEntity? get editingInfo {
    _$editingInfoAtom.reportRead();
    return super.editingInfo;
  }

  @override
  set editingInfo(InfoEntity? value) {
    _$editingInfoAtom.reportWrite(value, super.editingInfo, () {
      super.editingInfo = value;
    });
  }

  late final _$_InfoStoreActionController =
      ActionController(name: '_InfoStore', context: context);

  @override
  void addInfo(String content) {
    final _$actionInfo =
        _$_InfoStoreActionController.startAction(name: '_InfoStore.addInfo');
    try {
      return super.addInfo(content);
    } finally {
      _$_InfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editInfo(InfoEntity value) {
    final _$actionInfo =
        _$_InfoStoreActionController.startAction(name: '_InfoStore.editInfo');
    try {
      return super.editInfo(value);
    } finally {
      _$_InfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEditingInfo(InfoEntity? value) {
    final _$actionInfo = _$_InfoStoreActionController.startAction(
        name: '_InfoStore.setEditingInfo');
    try {
      return super.setEditingInfo(value);
    } finally {
      _$_InfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteInfo(InfoEntity value) {
    final _$actionInfo =
        _$_InfoStoreActionController.startAction(name: '_InfoStore.deleteInfo');
    try {
      return super.deleteInfo(value);
    } finally {
      _$_InfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
infos: ${infos},
editingInfo: ${editingInfo}
    ''';
  }
}
