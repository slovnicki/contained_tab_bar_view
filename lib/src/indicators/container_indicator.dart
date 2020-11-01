import 'package:flutter/material.dart';

class ContainerIndicator extends Decoration {
  final double width;
  final double height;
  final double radius;
  final Color color;

  const ContainerIndicator({
    this.width: 8.0,
    this.height: 8.0,
    this.radius: 4.0,
    this.color: const Color(0xff000000),
  });

  @override
  _ContainerPainter createBoxPainter([void Function() onChanged]) {
    return _ContainerPainter(onChanged, decoration: this);
  }
}

class _ContainerPainter extends BoxPainter {
  final ContainerIndicator decoration;

  _ContainerPainter(
    void Function() onChanged,
    {this.decoration: const ContainerIndicator()}
  ): super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final RRect indicatorRRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(offset.dx + configuration.size.width / 2, configuration.size.height / 2),
        width: this.decoration.width,
        height: this.decoration.height
      ),
      Radius.circular(this.decoration.radius)
    );

    final Paint paint = Paint()
      ..color = this.decoration.color
      ..style = PaintingStyle.fill;

    canvas.drawRRect(indicatorRRect, paint);
  }
}