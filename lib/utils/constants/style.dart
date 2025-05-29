import 'package:flutter/material.dart';
import 'dart:math';

Color light = const Color(0xFFF7F8FC);
Color lightGrey = const Color(0xFFA4A6B3);
Color dark = const Color(0xFF363740);
Color active = const Color(0xFF3C19C0);
Color c1 = const Color(0xFF846AFF);
Color c2 = const Color(0xFF755EE8);
Color background = Color.fromARGB(255, 222, 228, 240);
Color CN1 = const Color(0xFF7DA0FA);
Color CN2 = const Color(0xFF7978E9);
Color CN3 = const Color(0xFFF3797E);
Color P1 = const Color(0xFF4B49AC);
Color P2 = const Color(0xFF98BDFF);
class coler {
 Color getDarkColorByIndex(int i) {
    // بذرة ثابتة لضمان نفس النتائج كل مرة
    final Random random = Random(i);

    // توليد لون بتدرجات داكنة (إضاءة منخفضة)
    return HSLColor.fromAHSL(
      1.0, // Opacity (1.0 =完全不透明)
      random.nextDouble() * 360, // Hue (0-360 درجة لونية)
      0.7 + random.nextDouble() * 0.3, // Saturation (70-100% تشبع)
      0.2 + random.nextDouble() * 0.3, // Lightness (20-50% إضاءة لجعلها داكنة)
    ).toColor();
  }


// نسخة بديلة مع تدرجات أكثر تناسقاً
  Color generateHarmoniousColor(int seed) {
    final Random random = Random(seed);
    final int baseColor = random.nextInt(360);

    return HSLColor.fromAHSL(
      1.0,
      baseColor.toDouble(), // Hue (0-360)
      0.7 + random.nextDouble() * 0.3, // Saturation (0.7-1.0)
      0.6 + random.nextDouble() * 0.3, // Lightness (0.6-0.9)
    ).toColor();
  }
  
}