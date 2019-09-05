/*
 * Created with Android Studio.
 * User: WangQing
 * Date: 2019-09-05
 * Time: 17:05
 * target: 显示 Toast。
 */
import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart';

class ZKToast {
  static show(BuildContext context, String msg, {duration = 1}) {
    Toast.show(msg, context, duration: duration, gravity: Toast.BOTTOM);
  }
}
