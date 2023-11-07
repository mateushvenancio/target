import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:target/entities/info_entity.dart';
import 'package:target/repositories/i_infos_repository.dart';

part 'infos_store.g.dart';

class InfoStore = _InfoStore with _$InfoStore;

abstract class _InfoStore with Store {
  final infosRepository = GetIt.I<IInfosRepository>();

  _InfoStore() {
    _init();
  }

  @action
  _init() async {
    infos.clear();
    infos.addAll(await infosRepository.getInfos());
  }

  @observable
  ObservableList<InfoEntity> infos = ObservableList<InfoEntity>();

  @observable
  InfoEntity? editingInfo;

  @action
  void addInfo(String content) {
    final newInfo = InfoEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
    );
    infos.add(newInfo);
    infosRepository.addInfo(newInfo);
  }

  @action
  void editInfo(InfoEntity value) {
    editingInfo = null;
    final index = infos.indexWhere((element) => element.id == value.id);
    if (index == -1) return;
    infos.removeAt(index);
    infos.insert(index, value);
    infosRepository.editInfo(value);
  }

  @action
  setEditingInfo(InfoEntity? value) {
    editingInfo = value;
  }

  @action
  void deleteInfo(InfoEntity value) {
    if (value.id == editingInfo?.id) {
      editingInfo = null;
    }
    infos.removeWhere((element) => element.id == value.id);
    infosRepository.deleteInfo(value);
  }
}
