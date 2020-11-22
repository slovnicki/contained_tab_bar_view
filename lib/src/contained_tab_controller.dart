import 'package:flutter/material.dart';

class ContainedTabController extends TabController {
  final int initialIndex;
  final int length;
  final TickerProvider vsync;
  final Duration duration;
  final Curve curve;

  ContainedTabController({
    this.initialIndex: 0,
    @required this.length,
    @required this.vsync,
    this.duration: kTabScrollDuration,
    this.curve: Curves.ease,
  }) : super(
          length: length,
          vsync: vsync,
          initialIndex: initialIndex,
        );

  @override
  void animateTo(
    int value, {
    Duration duration = kTabScrollDuration,
    Curve curve = Curves.ease,
  }) {
    super.animateTo(
      value,
      duration: this.duration,
      curve: this.curve,
    );
  }
}
