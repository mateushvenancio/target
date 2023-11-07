import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:target/entities/info_entity.dart';
import 'package:target/repositories/i_infos_repository.dart';

class LocalInfosRepository implements IInfosRepository {
  final key = 'infos_key';
  late final SharedPreferences _prefs;
  final completer = Completer();

  LocalInfosRepository() {
    SharedPreferences.getInstance().then((value) {
      _prefs = value;
      completer.complete();
    });
  }

  @override
  Future<void> deleteInfo(InfoEntity value) async {
    await completer.future;
    final infos = await getInfos();
    final index = infos.indexWhere((element) => element.id == value.id);
    infos.removeAt(index);
    await _save(infos);
  }

  @override
  Future<InfoEntity> editInfo(InfoEntity value) async {
    await completer.future;
    final infos = await getInfos();
    final index = infos.indexWhere((element) => element.id == value.id);
    infos.removeAt(index);
    infos.insert(index, value);
    await _save(infos);
    return infos[index];
  }

  @override
  Future<List<InfoEntity>> getInfos() async {
    await completer.future;
    final result = [...jsonDecode(_prefs.getString(key) ?? '[]')];
    4;
    return result.map((e) => _fromJson(e)).toList();
  }

  @override
  Future<void> addInfo(InfoEntity value) async {
    await completer.future;
    final infos = await getInfos();
    infos.add(value);
    await _save(infos);
  }

  _save(List<InfoEntity> value) async {
    await completer.future;
    await _prefs.setString(
      key,
      jsonEncode(value.map((e) {
        return _toJson(e);
      }).toList()),
    );
  }

  Map<String, dynamic> _toJson(InfoEntity value) {
    return {
      'id': value.id,
      'content': value.content,
    };
  }

  InfoEntity _fromJson(Map<String, dynamic> value) {
    return InfoEntity(
      id: value['id'],
      content: value['content'],
    );
  }
}
