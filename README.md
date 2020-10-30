# ContainedTabBarView

`ContainedTabBarView` encapsulates `TabController`, `TabBar` and `TabBarView` into a single, easy to use, constrainable `Widget`.

## Example

```dart
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

![screenshot1](https://raw.githubusercontent.com/slovnicki/contained_tab_bar_view/master/docs/assets/1.png)






