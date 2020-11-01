import 'package:flutter/material.dart';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ContainedTabBarView Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExampleButton(route: '/example1'),
              ExampleButton(route: '/example2'),
              ExampleButton(route: '/example3'),
              ExampleButton(route: '/example4'),
              ExampleButton(route: '/example5'),
              ExampleButton(route: '/example6'),
            ],
          ),
        ),
      ),
      routes: {
        '/example1': (context) => Example1(),
        '/example2': (context) => Example2(),
        '/example3': (context) => Example3(),
        '/example4': (context) => Example4(),
        '/example5': (context) => Example5(),
        '/example6': (context) => Example6(),
      },
    );
  }
}

class ExampleButton extends StatelessWidget {
  final String route;

  ExampleButton({this.route});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.blue,
      onPressed: () => Navigator.of(context).pushNamed(this.route),
      child: Text(this.route, style: TextStyle(color: Colors.white))
    );
  }
}

class Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example 1'),
      ),
      body: Center(
        child: Container(
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
      ),
    );
  }
}

class Example2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example 2'),
      ),
      body: ContainedTabBarView(
        tabs: [
          Text('First', style: TextStyle(color: Colors.black)),
          Text('Second', style: TextStyle(color: Colors.black))
        ],
        views: [
          Container(color: Colors.red),
          Container(color: Colors.green)
        ],
        onChange: (index) => print(index),
      ),
    );
  }
}

class Example3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example 3'),
      ),
      body: ContainedTabBarView(
        tabs: [
          Text('First'),
          Text('Second')
        ],
        tabBarProperties: TabBarProperties(
          height: 32.0,
          indicatorColor: Colors.black,
          indicatorWeight: 6.0,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey[400]
        ),
        views: [
          Container(color: Colors.red),
          Container(color: Colors.green)
        ],
        onChange: (index) => print(index),
      ),
    );
  }
}

class Example4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example 4'),
      ),
      body: ContainedTabBarView(
        tabs: [
          Text('First'),
          Text('Second')
        ],
        tabBarProperties: TabBarProperties(
          indicator: ContainerIndicator(
            width: 64.0,
            height: 32.0,
            radius: 16.0,
            color: Colors.blue,
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[400]
        ),
        views: [
          Container(color: Colors.red),
          Container(color: Colors.green)
        ],
        onChange: (index) => print(index),
      ),
    );
  }
}

class Example5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example 5'),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 360,
          child: ContainedTabBarView(
            tabs: [
              Text('First'),
              Text('Second')
            ],
            tabBarPosition: TabBarPosition.bottom,
            tabBarAlignment: TabBarAlignment.end,
            tabBarProperties: TabBarProperties(
              width: 200,
              height: 32,
              backgroundDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 0.5,
                    blurRadius: 2,
                    offset: Offset(1, 1),
                  ),
                ]
              ),
              indicatorColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[400],
            ),
            views: [
              Container(color: Colors.red),
              Container(color: Colors.green)
            ],
            onChange: (index) => print(index),
          ),
        ),
      ),
    );
  }
}

class Example6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example 6'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          child: ContainedTabBarView(
            tabs: [
              ...[1,2].map((e) => Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey[600]),
                  borderRadius: BorderRadius.all(Radius.circular(4.0))
                ),
              )).toList()          
            ],
            tabBarPosition: TabBarPosition.bottom,
            tabBarProperties: TabBarProperties(
              width: 64,
              height: 32,
              indicator: ContainerIndicator(
                width: 16.0,
                height: 16.0,
                radius: 4.0,
                color: Colors.blue,
              ),
            ),
            views: [
              Container(color: Colors.red),
              Container(color: Colors.green)
            ],
            onChange: (index) => print(index),
          ),
        ),
      ),
    );
  }
}