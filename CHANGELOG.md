# 0.7.1

- fix calling `onChange` twice when tab is tapped

# 0.7.0

- add `tabBarViewProperties`
- add `innerPadding` option to `tabBarProperties`

# 0.6.0

- export `container_tab_indicator` package as a part of this package
- leave `ContainerIndicator` for now, but will be removed in the future

# 0.5.0

- add `outerPadding` option to `TabBarProperties`
- change `backgroundStack` to `background` (`Container`)

# 0.4.0

- expose some `State` methods for switching tabs from outside
- enable the usage of `BorderRadius` at `ContainerIndicator`, instead of just `double`
- move `tabBarPosition` and `tabBarAlignment` into `TabBarProperties`
- rename `backgroundDecoration` to `backgroundStack` and enhance usage possibilities to arbitrary `Stack` instead of just `BoxDecoration`
- implement `TabBarPosition.left` and `TabBarPosition.right`

# 0.3.2

- format code with `dartfmt`

# 0.3.1

- add `ContainerIndicator`

# 0.3.0

- add `tabBarAlignment` and `TabBarProperties.backgroundDecoration` options

# 0.2.0

- implement `tabBarProperties` option

# 0.1.0

- `ContainedTabBarView` can be placed as a chid of `Container`, without causing overflows.
- `onChange` works
