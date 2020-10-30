library contained_tab_bar_view;

import 'package:flutter/material.dart';

enum TabBarPosition {
  top,
  bottom
  // TODO left
  // TODO right
}

class TabBarProperties {
  // TODO
  // https://api.flutter.dev/flutter/material/TabBar-class.html#instance-properties
}

class ContainedTabBarView extends StatefulWidget {
  final List<Widget> tabs;
  final List<Widget> views;
  final TabBarProperties tabBarProperties;
  final TabBarPosition tabBarPosition;
  final double tabBarHeight;
  final int initialIndex;
  final void Function(int) onChange;

  ContainedTabBarView({
    this.tabs,
    this.views,
    this.tabBarProperties,
    this.tabBarPosition: TabBarPosition.top,
    this.tabBarHeight: 48,
    this.initialIndex: 0,
    this.onChange
  }): assert(tabs != null),
      assert(views != null);

  @override
  State<StatefulWidget> createState() => ContainedTabBarViewState();
}

class ContainedTabBarViewState extends State<ContainedTabBarView> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.initialIndex
    )..addListener(() => widget.onChange(_controller.index));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints)
        => Column(
          children: _buildChildren(constraints)
        )
    );
  }

  List<Widget> _buildChildren(BoxConstraints constraints) {
    List<Widget> children = [
      Container(
        height: widget.tabBarHeight,
        child: TabBar(
          controller: _controller,
          tabs: widget.tabs
          // TODO TabBarProperties
        )
      ),
      Container(
        height: constraints.maxHeight - widget.tabBarHeight,
        child: TabBarView(
          controller: _controller,
          children: widget.views
        ),
      )
    ];

    if (widget.tabBarPosition == TabBarPosition.bottom) {
      return children.reversed.toList();
    }

    return children;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

