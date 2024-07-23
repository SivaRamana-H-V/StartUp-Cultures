import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(218, 30.2743);
    path_0.cubicTo(55.5117, 83.5075, 197.988, 146.541, 81.4998, 155.274);
    path_0.cubicTo(1.88472, 161.243, -7.83097, 248.631, -6.00458, 303.356);
    path_0.cubicTo(-5.3714, 322.328, -24.8995, 337.516, -42.4447, 330.269);
    path_0.lineTo(-156.818, 283.031);
    path_0.cubicTo(-169.069, 277.972, -174.898, 263.938, -169.838, 251.687);
    path_0.lineTo(-50.7143, -36.7364);
    path_0.cubicTo(-46.7706, -46.2849, -37.2335, -52.2377, -26.9363, -51.4038);
    path_0.cubicTo(50.8915, -45.1005, 360.633, -16.454, 218, 30.2743);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffFFC123).withOpacity(0.5);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter12 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(206.614, 37.8235);
    path_0.cubicTo(70.5032, 86.989, 187.859, 139.127, 90.815, 148.823);
    path_0.cubicTo(26.5734, 155.242, 15.4857, 226.785, 15.33, 274.416);
    path_0.cubicTo(15.2688, 293.106, -4.03227, 307.715, -21.3069, 300.58);
    path_0.lineTo(-105.818, 265.675);
    path_0.cubicTo(-118.069, 260.616, -123.898, 246.582, -118.838, 234.331);
    path_0.lineTo(-16.3563, -13.7987);
    path_0.cubicTo(-12.4752, -23.1955, -3.22958, -29.1295, 6.9164, -28.4796);
    path_0.cubicTo(75.425, -24.0916, 324.584, -4.78941, 206.614, 37.8235);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffFFF4D6).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Copy this CustomPainter code to the Bottom of the File
class Vector1 extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(0.500088,232.408);
    path_0.cubicTo(-37.7486,229.432,18.7479,189.51,-19.5,186.5);
    path_0.cubicTo(-23.12,186.215,-7.99998,141.623,-7.99998,141.623);
    path_0.lineTo(-7.99998,0);
    path_0.lineTo(393,0);
    path_0.cubicTo(393,0,407.489,63.3087,380.5,95);
    path_0.cubicTo(331.318,152.751,176.482,98.3774,121,130);
    path_0.cubicTo(76.0989,155.592,47.3752,236.054,0.500088,232.408);
    path_0.close();

Paint paint0Fill = Paint()..style=PaintingStyle.fill;
paint0Fill.color = const Color(0xffECA730).withOpacity(1.0);
canvas.drawPath(path_0,paint0Fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}