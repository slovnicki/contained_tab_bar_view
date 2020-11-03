import 'package:flutter/material.dart';

import 'enums.dart';
import 'tab_bar_properties.dart';

class ContainedTabBarView extends StatefulWidget {
  final List<Widget> tabs;
  final List<Widget> views;
  final TabBarProperties tabBarProperties;
  final TabBarPosition tabBarPosition;
  final TabBarAlignment tabBarAlignment;
  final int initialIndex;
  final void Function(int) onChange;

  ContainedTabBarView({
    Key key,
    this.tabs,
    this.views,
    this.tabBarProperties: TabBarProperties.empty,
    this.tabBarPosition: TabBarPosition.top,
    this.tabBarAlignment: TabBarAlignment.center,
    this.initialIndex: 0,
    this.onChange,
  })  : assert(tabs != null),
        assert(views != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => ContainedTabBarViewState();
}

class ContainedTabBarViewState extends State<ContainedTabBarView>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.initialIndex,
    )..addListener(() => widget.onChange(_controller.index));
  }

  void animateTo(
    int value, {
    Duration duration: kTabScrollDuration,
    Curve curve: Curves.ease,
  }) =>
      _controller.animateTo(value, duration: duration, curve: curve);

  void next({
    Duration duration: kTabScrollDuration,
    Curve curve: Curves.ease,
  }) {
    if (_controller.index == _controller.length - 1) {
      return;
    }
    this.animateTo(_controller.index + 1);
  }

  void previous({
    Duration duration: kTabScrollDuration,
    Curve curve: Curves.ease,
  }) {
    if (_controller.index == 0) {
      return;
    }
    this.animateTo(_controller.index - 1);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Column(
        crossAxisAlignment: _decideAlignment(widget.tabBarAlignment),
        children: _buildChildren(constraints),
      ),
    );
  }

  List<Widget> _buildChildren(BoxConstraints constraints) {
    List<Widget> children = [
      Container(
        width: widget.tabBarProperties.width,
        height: widget.tabBarProperties.height,
        decoration: widget.tabBarProperties.backgroundDecoration,
        child: _buildTabBar(),
      ),
      Container(
        height: constraints.maxHeight - widget.tabBarProperties.height,
        child: TabBarView(
          controller: _controller,
          children: widget.views,
        ),
      )
    ];

    if (widget.tabBarPosition == TabBarPosition.bottom) {
      return children.reversed.toList();
    }

    return children;
  }

  TabBar _buildTabBar() {
    return TabBar(
      controller: _controller,
      tabs: widget.tabs,
      indicator: widget.tabBarProperties.indicator,
      indicatorColor: widget.tabBarProperties.indicatorColor,
      indicatorPadding: widget.tabBarProperties.indicatorPadding,
      indicatorSize: widget.tabBarProperties.indicatorSize,
      indicatorWeight: widget.tabBarProperties.indicatorWeight,
      isScrollable: widget.tabBarProperties.isScrollable,
      labelColor: widget.tabBarProperties.labelColor,
      labelPadding: widget.tabBarProperties.labelPadding,
      labelStyle: widget.tabBarProperties.labelStyle,
      unselectedLabelColor: widget.tabBarProperties.unselectedLabelColor,
      unselectedLabelStyle: widget.tabBarProperties.unselectedLabelStyle,
    );
  }

  CrossAxisAlignment _decideAlignment(TabBarAlignment alignment) {
    switch (alignment) {
      case TabBarAlignment.start:
        return CrossAxisAlignment.start;
      case TabBarAlignment.center:
        return CrossAxisAlignment.center;
      case TabBarAlignment.end:
        return CrossAxisAlignment.end;
      default:
        return CrossAxisAlignment.center;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
