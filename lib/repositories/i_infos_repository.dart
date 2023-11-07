import 'package:target/entities/info_entity.dart';

abstract interface class IInfosRepository {
  Future<List<InfoEntity>> getInfos();
  Future<InfoEntity> editInfo(InfoEntity value);
  Future<void> deleteInfo(InfoEntity value);
}
