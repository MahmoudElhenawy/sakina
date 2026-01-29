import 'package:flutter/material.dart';

class AppColors {
  // ===== الألوان الأساسية المحسّنة =====

  // اللون الأساسي - أخضر داكن جداً (للهيدر والعناصر الرئيسية)
  static const Color primaryColor = Color(0xFF0d2818);

  // اللون الثانوي - ذهبي فاخر (للبسملة والتفاصيل المهمة)
  static const Color secondaryColor = Color(0xFFd4af37);

  // خلفية الـ Scaffold - أخضر داكن متوسط
  static const Color backgroundScaffold = Color(0xFF152d20);

  // خلفية الكاردات - أخضر متوسط
  static const Color cardBackground = Color(0xFF1a4d2e);

  // لون النص الثانوي - ذهبي فاتح/كريمي
  static const Color secondaryText = Color(0xFFc9b896);

  // ===== ألوان النصوص =====

  // النص الرئيسي - أبيض نقي تقريباً
  static const Color textPrimary = Color(0xFFF5F5F5);

  // النص الثانوي الفاتح - أبيض شفاف 85%
  static const Color textSecondary = Color(0xD9FFFFFF);

  // النص الباهت - أبيض شفاف 60%
  static const Color textMuted = Color(0x99FFFFFF);

  // ===== ألوان الذهبي بدرجات مختلفة =====

  // ذهبي فاتح جداً (للنصوص على خلفية داكنة)
  static const Color goldLight = Color(0xFFe8d4a0);

  // ذهبي متوسط (الأساسي)
  static const Color goldMedium = Color(0xFFd4af37);

  // ذهبي داكن (للحدود والتفاصيل)
  static const Color goldDark = Color(0xFFb8956a);

  // ===== ألوان الخلفيات والـ Overlays =====

  // خلفية شبه شفافة داكنة - 30%
  static const Color overlayDark = Color(0x4D0d2818);

  // خلفية شبه شفافة فاتحة - 10%
  static const Color overlayLight = Color(0x1A0d2818);

  // خلفية الكاردات الداخلية
  static const Color cardInner = Color(0xFF0f3a24);

  // ===== ألوان الحدود =====

  // حدود ذهبية خفيفة - 15%
  static const Color borderLight = Color(0x26d4af37);

  // حدود ذهبية متوسطة - 35%
  static const Color borderMedium = Color(0x59d4af37);

  // حدود ذهبية قوية - 60%
  static const Color borderStrong = Color(0x99d4af37);

  // حدود بيضاء خفيفة - 5%
  static const Color borderWhiteLight = Color(0x0DFFFFFF);

  // حدود بيضاء متوسطة - 10%
  static const Color borderWhiteMedium = Color(0x1AFFFFFF);

  // ===== ألوان إضافية للتفاعل =====

  // لون النجاح - أخضر فاتح
  static const Color success = Color(0xFF4caf50);

  // لون التحذير - برتقالي
  static const Color warning = Color(0xFFff9800);

  // لون الخطأ - أحمر
  static const Color error = Color(0xFFf44336);

  // لون المعلومات - أزرق فاتح
  static const Color info = Color(0xFF2196f3);

  // ===== ألوان الظلال =====

  // ظل أسود خفيف - للكاردات
  static const Color shadowLight = Color(0x1A000000);

  // ظل أسود متوسط - للعناصر المرفوعة
  static const Color shadowMedium = Color(0x40000000);

  // ظل أسود قوي - للعناصر البارزة
  static const Color shadowStrong = Color(0x66000000);

  // ظل ذهبي - للعناصر المميزة
  static const Color shadowGold = Color(0x1Fd4af37);
}
