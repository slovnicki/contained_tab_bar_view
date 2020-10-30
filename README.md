# ContainedTabBarView

`ContainedTabBarView` encapsulates `TabController`, `TabBar` and `TabBarView` into a single, easy to use, constrainable `Widget`.

## Usage

To use this package, add `contained_tab_bar_view` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

## Example

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

![screenshot1](https://raw.githubusercontent.com/slovnicki/contained_tab_bar_view/master/doc/assets/1.gif)






