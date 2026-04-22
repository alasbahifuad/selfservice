# 🏗️ Self-Service App — Build Plan

> خارطة طريق مرحلية لبناء تطبيق الخدمة الذاتية بـ Flutter

---

## نظرة عامة

| Item | Detail |
|------|--------|
| **Platform** | Android (Flutter) |
| **Direction** | RTL (Arabic) |
| **Design System** | Material 3 Custom Theme |
| **Total Unique Screens** | 28 |
| **Phases** | 6 مراحل |

---

## المرحلة 1: إعداد المشروع والنظام التصميمي (Phase 1)
**المدة المتوقعة: 2-3 أيام**

### 1.1 إنشاء مشروع Flutter
- [ ] إنشاء مشروع Flutter جديد
- [ ] إعداد بنية المجلدات (lib/core, lib/features, lib/shared)
- [ ] إضافة التبعيات الأساسية (go_router, flutter_riverpod, etc.)

### 1.2 نظام الألوان (Theme)
- [ ] إنشاء `app_colors.dart` مع جميع Material 3 tokens
- [ ] إنشاء `app_theme.dart` مع ThemeData كامل
- [ ] دعم الوضع الفاتح (Dark mode مؤجل)

### 1.3 نظام الخطوط
- [ ] إضافة خطوط: Cairo, Plus Jakarta Sans, IBM Plex Sans Arabic
- [ ] إنشاء `app_typography.dart` مع TextTheme كامل

### 1.4 المكونات المشتركة الأساسية
- [ ] `AppCard` — بطاقة موحدة (standard + hero variants)
- [ ] `AppButton` — أزرار (primary, secondary, text)
- [ ] `AppTextField` — حقل إدخال موحد
- [ ] `StatusBadge` — شارة الحالة (حاضر/متأخر/غائب/مقبول/مرفوض)
- [ ] `AppBottomNav` — شريط التنقل السفلي (glassmorphism)
- [ ] `AppTopBar` — شريط علوي
- [ ] `HeroSummaryCard` — بطاقة ملخص gradient
- [ ] `SectionHeader` — عنوان قسم

### 1.5 الثوابت والأدوات
- [ ] `app_constants.dart` — أبعاد، padding، border radius
- [ ] `app_spacing.dart` — نظام التباعد
- [ ] `app_icons.dart` — مرجع الأيقونات المستخدمة

---

## المرحلة 2: شاشات المصادقة والبداية (Phase 2)
**المدة المتوقعة: 1-2 يوم**

### 2.1 Splash Screen
- [ ] خلفية gradient (primary → primary-container)
- [ ] شعار التطبيق مع glassmorphism
- [ ] نص "الخدمة الذاتية" + tagline
- [ ] انتقال تلقائي لشاشة الدخول

### 2.2 Login Screen
- [ ] شعار التطبيق أعلى الشاشة
- [ ] حقل اسم المستخدم مع أيقونة
- [ ] حقل كلمة المرور مع أيقونة
- [ ] خيار "تذكرني" + "نسيت كلمة المرور؟"
- [ ] زر تسجيل الدخول (secondary color)
- [ ] حقوق النشر في الأسفل

### 2.3 التوجيه (Routing)
- [ ] إعداد go_router مع حماية المسارات
- [ ] Shell route للشاشات مع bottom nav

---

## المرحلة 3: الشاشات الأساسية للموظف (Phase 3)
**المدة المتوقعة: 4-5 أيام**

### 3.1 الرئيسية (Home)
- [ ] Hero card مع رسالة ترحيب
- [ ] شبكة إحصائيات (حاضر/متأخر/غائب/خصومات)
- [ ] اختصارات سريعة (الخصومات، قسيمة الراتب)
- [ ] Footer مع حقوق النشر

### 3.2 الحضور (Attendance)
- [ ] عرض الوقت الحالي بخط كبير
- [ ] مؤشر الموقع الجغرافي (GPS)
- [ ] زر تسجيل حضور (gradient كبير)
- [ ] زر تسجيل انصراف
- [ ] ملخص اليوم (timeline عمودي)

### 3.3 سجل الحضور (Attendance Log)
- [ ] تبويبات الأشهر (أفقي scrollable)
- [ ] بطاقات يومية مع تاريخ بارز
- [ ] وقت الدخول/الخروج
- [ ] طريقة التسجيل (بصمة/GPS)
- [ ] شارة الحالة لكل يوم

### 3.4 التنبيهات (Notifications)
- [ ] فلتر تبويبات (الكل/الحضور/الإجازات/الراتب)
- [ ] عدد التنبيهات غير المقروءة
- [ ] زر "تحديد الكل كمقروء"
- [ ] بطاقات تنبيه مع أيقونة ملونة + وقت
- [ ] فصل حسب الفترة (اليوم/الأسبوع الماضي)

### 3.5 الملف الشخصي (Profile)
- [ ] صورة المستخدم + الاسم + المسمى
- [ ] معلومات الوظيفة (رقم، قسم، تاريخ التعيين)
- [ ] خيارات (تعديل الملف، الإعدادات، الدعم، تسجيل خروج)

### 3.6 تعديل الملف الشخصي
- [ ] حقول قابلة للتعديل (الاسم، البريد، الهاتف)
- [ ] تغيير الصورة
- [ ] أزرار حفظ/إلغاء

---

## المرحلة 4: الخدمات المالية والإجازات (Phase 4)
**المدة المتوقعة: 3-4 أيام**

### 4.1 قسيمة الراتب (Salary Slip)
- [ ] أزرار مشاركة + طباعة
- [ ] بطاقة صافي الراتب (gradient كبير)
- [ ] معلومات الموظف
- [ ] قسم الاستحقاقات (راتب أساسي، بدلات، حوافز)
- [ ] قسم الاستقطاعات (تأمينات، قروض، غياب)
- [ ] إجمالي لكل قسم

### 4.2 الخصومات (Deductions)
- [ ] فلتر حسب الشهر
- [ ] قائمة خصومات مع النوع والمبلغ
- [ ] إجمالي الخصومات

### 4.3 إدارة الإجازات (Leave Management)
- [ ] بطاقة الرصيد المتاح (gradient)
- [ ] نموذج طلب إجازة جديد
  - [ ] اختيار نوع الإجازة (أيقونات: سنوية/طارئة/مرضية/أخرى)
  - [ ] تاريخ البداية والنهاية
  - [ ] سبب اختياري
  - [ ] زر تقديم
- [ ] قائمة الطلبات السابقة مع الحالة

### 4.4 التقارير الشهرية (Monthly Reports)
- [ ] فلتر الشهر والسنة (dropdowns)
- [ ] بطاقات إحصائيات (إجمالي حضور، تأخير، غياب، خصومات)
- [ ] سجل الدوام التفصيلي (قائمة أيام)

---

## المرحلة 5: لوحة الإدارة (Phase 5)
**المدة المتوقعة: 5-6 أيام**

### 5.1 لوحة المعلومات (Admin Dashboard)
- [ ] بطاقات إحصائيات كبيرة
- [ ] رسم بياني (حضور شهري)
- [ ] آخر الأنشطة

### 5.2 إدارة الموظفين
- [ ] شريط بحث + فلاتر
- [ ] قائمة موظفين (avatar + اسم + قسم + حالة)
- [ ] عرض تفاصيل الموظف

### 5.3 إدارة الطلبات
- [ ] تبويبات حالة (الكل/جديد/معتمد/مرفوض)
- [ ] قائمة طلبات مع معلومات مختصرة
- [ ] شاشة تفاصيل الطلب مع timeline + أزرار إجراء

### 5.4 إعدادات النظام
- [ ] شبكة بطاقات الإعدادات (شركة/دوام/إشعارات/GPS)
- [ ] قسم الهيكل التنظيمي (فروع/أقسام/ورديات/صلاحيات)

### 5.5 سجل الأحداث (Audit Log)
- [ ] فصل حسب التاريخ
- [ ] بطاقات أحداث مع نوع + مصدر + وقت + وصف
- [ ] ألوان مختلفة حسب نوع الحدث
- [ ] زر "تحميل المزيد"

---

## المرحلة 6: نظام التقييم والميزات المتقدمة (Phase 6)
**المدة المتوقعة: 4-5 أيام**

### 6.1 إعدادات معايير التقييم
- [ ] أوزان المعايير مع شريط تقدم
- [ ] إضافة/تعديل معيار
- [ ] مسميات النجوم (استثنائي → أقل من المتوقع)
- [ ] حفظ التغييرات

### 6.2 تقييم الأداء الشهري
- [ ] اختيار الموظف + الشهر
- [ ] بطاقات معايير مع تقييم نجوم
- [ ] ملاحظات إضافية
- [ ] زر اعتماد التقييم

### 6.3 تقرير تقييم الموظف
- [ ] معلومات الموظف + فترة التقييم
- [ ] تفاصيل التقييم لكل معيار (نجوم + درجة)
- [ ] النتيجة النهائية مع تعليق
- [ ] أزرار تصدير (PDF / Excel)

### 6.4 تقرير التقييم الإجمالي
- [ ] فلتر الشهر/السنة
- [ ] قائمة موظفين مع النسبة المئوية
- [ ] شريط تقدم ملون لكل موظف
- [ ] إجمالي متوسط التقييم على مستوى الإدارة

### 6.5 المهام (Tasks)
- [ ] بطاقات إحصائيات (إجمالي/مكتملة/متأخرة)
- [ ] قائمة المهام مع حالة + تاريخ + أولوية
- [ ] تذكيرات الإشعارات

### 6.6 المصروفات (Expenses)
- [ ] بطاقة الرصيد المتاح
- [ ] أزرار شحن/تحويل
- [ ] إجمالي المصروفات + الميزانية المتبقية
- [ ] أحدث العمليات
- [ ] رسم بياني دائري (تحليل الإنفاق)

---

## بنية المشروع المقترحة

```
lib/
├── main.dart
├── app.dart
├── core/
│   ├── theme/
│   │   ├── app_colors.dart
│   │   ├── app_theme.dart
│   │   └── app_typography.dart
│   ├── constants/
│   │   ├── app_constants.dart
│   │   └── app_spacing.dart
│   ├── routing/
│   │   └── app_router.dart
│   └── utils/
│       └── extensions.dart
├── shared/
│   ├── widgets/
│   │   ├── app_card.dart
│   │   ├── app_button.dart
│   │   ├── app_text_field.dart
│   │   ├── app_bottom_nav.dart
│   │   ├── app_top_bar.dart
│   │   ├── hero_summary_card.dart
│   │   ├── status_badge.dart
│   │   └── section_header.dart
│   └── models/
│       └── ...
├── features/
│   ├── auth/
│   │   ├── screens/
│   │   │   ├── splash_screen.dart
│   │   │   └── login_screen.dart
│   │   └── providers/
│   ├── home/
│   │   ├── screens/
│   │   │   └── home_screen.dart
│   │   └── widgets/
│   ├── attendance/
│   │   ├── screens/
│   │   │   ├── attendance_screen.dart
│   │   │   └── attendance_log_screen.dart
│   │   └── widgets/
│   ├── notifications/
│   │   ├── screens/
│   │   │   └── notifications_screen.dart
│   │   └── widgets/
│   ├── profile/
│   │   ├── screens/
│   │   │   ├── profile_screen.dart
│   │   │   └── edit_profile_screen.dart
│   │   └── widgets/
│   ├── salary/
│   │   ├── screens/
│   │   │   ├── salary_slip_screen.dart
│   │   │   └── deductions_screen.dart
│   │   └── widgets/
│   ├── leave/
│   │   ├── screens/
│   │   │   └── leave_management_screen.dart
│   │   └── widgets/
│   ├── reports/
│   │   ├── screens/
│   │   │   └── monthly_reports_screen.dart
│   │   └── widgets/
│   ├── requests/
│   │   ├── screens/
│   │   │   ├── submit_request_screen.dart
│   │   │   ├── request_list_screen.dart
│   │   │   └── request_detail_screen.dart
│   │   └── widgets/
│   ├── admin/
│   │   ├── screens/
│   │   │   ├── dashboard_screen.dart
│   │   │   ├── employee_list_screen.dart
│   │   │   ├── employee_detail_screen.dart
│   │   │   ├── settings_screen.dart
│   │   │   └── audit_log_screen.dart
│   │   └── widgets/
│   ├── evaluation/
│   │   ├── screens/
│   │   │   ├── eval_criteria_screen.dart
│   │   │   ├── monthly_eval_screen.dart
│   │   │   ├── eval_report_screen.dart
│   │   │   └── overall_eval_screen.dart
│   │   └── widgets/
│   ├── tasks/
│   │   ├── screens/
│   │   │   └── tasks_screen.dart
│   │   └── widgets/
│   └── expenses/
│       ├── screens/
│       │   └── expenses_screen.dart
│       └── widgets/
└── l10n/
    └── app_ar.arb
```

---

## التبعيات المقترحة

```yaml
dependencies:
  flutter_localizations:
    sdk: flutter
  go_router: ^14.0.0
  flutter_riverpod: ^2.5.0
  google_fonts: ^6.0.0
  fl_chart: ^0.68.0
  intl: ^0.19.0
  shared_preferences: ^2.2.0
  geolocator: ^11.0.0
  cached_network_image: ^3.3.0
  shimmer: ^3.0.0
```

---

## ملاحظات مهمة

1. **RTL أولاً**: جميع التخطيطات تُبنى RTL من البداية
2. **No-Line Rule**: لا خطوط فاصلة — التباين اللوني فقط
3. **48dp Touch Targets**: جميع العناصر التفاعلية ≥ 48dp
4. **Gradient Hero**: كل شاشة رئيسية تبدأ ببطاقة gradient
5. **Mock Data**: استخدام بيانات وهمية في جميع المراحل
6. **تصميم Pixel-Perfect**: الالتزام التام بالنماذج في مجلد UiUx
