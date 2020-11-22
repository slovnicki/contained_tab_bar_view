import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TabBarViewProperties {
  final DragStartBehavior dragStartBehavior;
  final ScrollPhysics physics;

  const TabBarViewProperties({
    this.dragStartBehavior: DragStartBehavior.start,
    this.physics,
  });
}
