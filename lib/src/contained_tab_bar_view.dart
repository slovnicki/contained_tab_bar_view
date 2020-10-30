import 'package:flutter/material.dart';

import 'enums.dart';
import 'tab_bar_properties.dart';

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
    this.tabBarProperties: TabBarProperties.empty,
    this.tabBarPosition: TabBarPosition.top,
    this.tabBarHeight: kToolbarHeight,
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
        child: _buildTabBar()
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

  TabBar _buildTabBar() {
    return TabBar(
      controller: _controller,
      tabs: widget.tabs,
      indicator: widget.tabBarProperties?.indicator,
      indicatorColor: widget.tabBarProperties?.indicatorColor,
      indicatorPadding: widget.tabBarProperties?.indicatorPadding,
      indicatorSize: widget.tabBarProperties?.indicatorSize,
      indicatorWeight: widget.tabBarProperties?.indicatorWeight,
      isScrollable: widget.tabBarProperties?.isScrollable,
      labelColor: widget.tabBarProperties?.labelColor,
      labelPadding: widget.tabBarProperties?.labelPadding,
      labelStyle: widget.tabBarProperties?.labelStyle,
      unselectedLabelColor: widget.tabBarProperties?.unselectedLabelColor,
      unselectedLabelStyle: widget.tabBarProperties?.unselectedLabelStyle,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}