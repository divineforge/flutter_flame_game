import 'dart:developer';
import 'dart:ui';

import 'package:flame/game.dart';
import 'components/player.dart';
import 'components/world.dart';
import 'components/world_collidable.dart';
import 'helpers/direction.dart';
import 'helpers/map_loader.dart';

class RayWorldGame extends FlameGame with HasCollisionDetection {
  final Player _player = Player();
  final World _world = World();

  @override
  Future<void> onLoad() async {
    await add(_world);
    add(_player);
    addWorldCollision();
    log('what is the world size' + _world.size.toString());
    _player.position = _world.size / 2;
    camera.followComponent(_player,
        worldBounds: Rect.fromLTRB(0, 0, _world.size.x, _world.size.y));
    log('this is the world size ${_world.size.toString()}');
  }

  void onJoypadDirectionChanged(Direction direction) {
    _player.direction = direction;
    log(direction.toString());
  }

  void addWorldCollision() async =>
      (await MapLoader.readRayWorldCollisionMap()).forEach((rect) {
        add(WorldCollidable()
          ..position = Vector2(rect.left, rect.top)
          ..width = rect.width
          ..height = rect.height);
      });
}
