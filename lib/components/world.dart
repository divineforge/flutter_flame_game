import 'dart:developer';

import 'package:flame/components.dart';

class World extends SpriteComponent with HasGameRef {
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('rayworld_background.png');
    size = sprite!.originalSize;
    log('what is sprite original size' + sprite!.originalSize.toString());
    return super.onLoad();
  }
}
