import 'package:flutter/material.dart';

class ContainerIndicator extends Decoration {
  final double width;
  final double height;
  final BorderRadius radius;
  final Color color;
  final double borderWidth;
  final Color borderColor;

  const ContainerIndicator({
    this.width: 8.0,
    this.height: 8.0,
    this.radius: BorderRadius.zero,
    this.color: const Color(0xff000000),
    this.borderWidth: 0.0,
    this.borderColor: const Color(0xff000000),
  });

  @override
  _ContainerPainter createBoxPainter([void Function() onChanged]) {
    return _ContainerPainter(
      onChanged,
      indicator: this,
    );
  }
}

class _ContainerPainter extends BoxPainter {
  final ContainerIndicator indicator;

  _ContainerPainter(
    void Function() onChanged, {
    this.indicator: const ContainerIndicator(),
  }) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    if (this.indicator.borderWidth > 0.0) {
      final RRect borderRRect = _buildRRect(
        offset,
        configuration,
        addOnWidth: this.indicator.borderWidth,
      );
      final Paint paint = Paint()
        ..color = this.indicator.borderColor
        ..style = PaintingStyle.fill;
      canvas.drawRRect(borderRRect, paint);
    }

    final RRect indicatorRRect = _buildRRect(offset, configuration);
    final Paint paint = Paint()
      ..color = this.indicator.color
      ..style = PaintingStyle.fill;
    canvas.drawRRect(indicatorRRect, paint);
  }

  RRect _buildRRect(
    Offset offset,
    ImageConfiguration configuration, {
    double addOnWidth: 0.0,
  }) {
    return RRect.fromRectAndCorners(
      Rect.fromCenter(
        center: Offset(offset.dx + configuration.size.width / 2,
            configuration.size.height / 2),
        width: this.indicator.width + 2 * addOnWidth,
        height: this.indicator.height + 2 * addOnWidth,
      ),
      topLeft: this.indicator.radius.topLeft,
      topRight: this.indicator.radius.topRight,
      bottomRight: this.indicator.radius.bottomRight,
      bottomLeft: this.indicator.radius.bottomLeft,
    );
  }
}
