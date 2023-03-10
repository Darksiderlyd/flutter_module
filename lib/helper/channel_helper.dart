import 'dart:ui';

import 'package:flutter_boost/flutter_boost.dart';

class MixChannel {
  static void sendEventToNative(String key, Map<String, Object> args) {
    BoostChannel.instance.sendEventToNative(key, args);
  }

  static VoidCallback addEventListener(String key, EventListener listener) {
    return BoostChannel.instance.addEventListener(key, listener);
  }

  static void removeListener(VoidCallback? remover) {
    remover?.call();
  }
}
