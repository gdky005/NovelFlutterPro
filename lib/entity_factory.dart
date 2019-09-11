import 'package:novel_pro/cc.zkteam.novel_pro/data/novel_list_data_entity.dart';
import 'package:novel_pro/cc.zkteam.novel_pro/data/user_entity.dart';
import 'package:novel_pro/cc.zkteam.novel_pro/data/novel_detail_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "NovelListDataEntity") {
      return NovelListDataEntity.fromJson(json) as T;
    } else if (T.toString() == "UserEntity") {
      return UserEntity.fromJson(json) as T;
    } else if (T.toString() == "NovelDetailEntity") {
      return NovelDetailEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}