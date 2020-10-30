import 'package:flutter/material.dart';

class TabBarProperties {
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

  static const TabBarProperties empty = TabBarProperties();

  const TabBarProperties({
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
    this.unselectedLabelStyle
  });
}