# تعليمات بناء تطبيق الخدمة الذاتية (Build Instructions)

للحصول على نسخة APK من التطبيق، يرجى اتباع الخطوات التالية في بيئة تحتوي على Flutter و Android SDK.

## المتطلبات الأساسية
1. تثبيت **Flutter SDK** (الإصدار 3.0 فما فوق).
2. تثبيت **Android SDK** و **Android Studio**.
3. التأكد من تشغيل `flutter doctor` بنجاح وتجاوز عقبات الـ Android Toolchain.

## خطوات البناء

### 1. تجهيز التبعيات
قم بتشغيل الأمر التالي للتأكد من تحميل كافة المكتبات المطلوبة:
```bash
flutter pub get
```

### 2. البناء لبيئة التطوير (Debug APK)
هذا الخيار مفيد للاختبار السريع:
```bash
flutter build apk --debug
```

### 3. البناء للنسخة النهائية (Release APK)
للحصول على نسخة خفيفة ومحسنة:
```bash
flutter build apk --release
```

### 4. البناء لـ App Bundle (للرفع على متجر Google Play)
```bash
flutter build appbundle
```

## مواقع الملفات الناتجة
بعد انتهاء البناء بنجاح، ستجد ملف الـ APK في المسار التالي داخل مجلد المشروع:
`build/app/outputs/flutter-apk/app-release.apk`

---
**ملاحظة:** إذا واجهت مشاكل في التوقيع (Signing)، يرجى التأكد من إعداد ملف `key.properties` في مجلد `android` إذا كنت تبني نسخة Release.
