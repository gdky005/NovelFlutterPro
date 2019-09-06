import 'package:novel_pro/cc.zkteam.novel_pro/data/novel_list_data_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "NovelListDataEntity") {
      return NovelListDataEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}