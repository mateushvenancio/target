import 'package:mobx/mobx.dart';
import 'package:target/entities/info_entity.dart';

part 'infos_store.g.dart';

class InfoStore = _InfoStore with _$InfoStore;

abstract class _InfoStore with Store {
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
  }

  @action
  void editInfo(InfoEntity value) {
    editingInfo = null;
    final index = infos.indexWhere((element) => element.id == value.id);
    if (index == -1) return;
    infos.removeAt(index);
    infos.insert(index, value);
  }

  @action
  setEditingInfo(InfoEntity? value) {
    editingInfo = value;
  }

  @action
  void deleteInfo(InfoEntity value) {
    infos.removeWhere((element) => element.id == value.id);
  }
}
