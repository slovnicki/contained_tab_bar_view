import 'package:contained_tab_bar_view/src/enums.dart';
import 'package:flutter/material.dart';

class TabBarProperties {
  final double width;
  final double height;
  final Container background;
  final TabBarPosition position;
  final TabBarAlignment alignment;
  final EdgeInsetsGeometry innerPadding;
  final EdgeInsetsGeometry outerPadding;

  final Decoration indicator;
  final Color indicatorColor;
  final EdgeInsetsGeometry indicatorPadding;
  final TabBarIndicatorSize indicatorSize;
  final double indicatorWeight;

  final bool isScrollable;

  final Color labelColor;
  final EdgeInsetsGeometry labelPadding;
  final TextStyle labelStyle;

  final Color unselectedLabelColor;
  final TextStyle unselectedLabelStyle;

  const TabBarProperties({
    this.width,
    this.height: kToolbarHeight,
    this.background,
    this.position: TabBarPosition.top,
    this.alignment: TabBarAlignment.center,
    this.innerPadding: const EdgeInsets.all(0.0),
    this.outerPadding: const EdgeInsets.all(0.0),
    this.indicator,
    this.indicatorColor,
    this.indicatorPadding: const EdgeInsets.all(0.0),
    this.indicatorSize,
    this.indicatorWeight: 2.0,
    this.isScrollable: false,
    this.labelColor,
    this.labelPadding: const EdgeInsets.all(0.0),
    this.labelStyle,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
  });
}
