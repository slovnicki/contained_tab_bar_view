# ContainedTabBarView

`ContainedTabBarView` encapsulates `TabController`, `TabBar` and `TabBarView` into a single, easy to use, constrainable `Widget`.

## Usage

To use this package, add `contained_tab_bar_view` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

## Examples

```dart
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

...

Container(
    padding: const EdgeInsets.all(8.0),
    color: Colors.blue,
    width: 200,
    height: 300,
    child: ContainedTabBarView(
        tabs: [
            Text('First'),
            Text('Second')
        ],
        views: [
            Container(color: Colors.red),
            Container(color: Colors.green)
        ],
        onChange: (index) => print(index),
    ),
)
```

<img src="https://raw.githubusercontent.com/slovnicki/contained_tab_bar_view/master/doc/assets/01.gif" alt="example 1" width="220" style="margin-right:16px;margin-bottom:16px">  

<!-- <img src="https://raw.githubusercontent.com/slovnicki/contained_tab_bar_view/master/doc/assets/2.gif" alt="example 2" width="270" style="margin-right:16px;margin-bottom:16px"> -->

<img src="https://raw.githubusercontent.com/slovnicki/contained_tab_bar_view/master/doc/assets/3.gif" alt="example 3" width="220" style="margin-right:16px;margin-bottom:16px">

<!-- <img src="https://raw.githubusercontent.com/slovnicki/contained_tab_bar_view/master/doc/assets/4.gif" alt="example 4" width="270" style="margin-right:16px;margin-bottom:16px"> -->

<img src="https://raw.githubusercontent.com/slovnicki/contained_tab_bar_view/master/doc/assets/5.gif" alt="example 5" width="220" style="margin-right:16px;margin-bottom:16px">



