import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mockNotifications = [
      {
        'title': 'دخول الموقع',
        'body': 'تم رصد دخولك إلى نطاق موقع العمل: فرع الإدارة الرئيسي.',
        'icon': Icons.location_on,
        'color': Colors.green,
        'time': 'منذ دقيقتين',
      },
      {
        'title': 'تسجيل الحضور',
        'body': 'تم تسجيل عملية الحضور بنجاح في تمام الساعة 08:32 ص.',
        'icon': Icons.check_circle,
        'color': AppColors.primary,
        'time': 'منذ 5 دقائق',
      },
      {
        'title': 'خروج الموقع',
        'body': 'تم رصد خروجك من نطاق موقع العمل.',
        'icon': Icons.location_off,
        'color': Colors.orange,
        'time': 'أمس، 05:00 م',
      },
      {
        'title': 'تسجيل الانصراف',
        'body': 'تم تسجيل عملية الانصراف بنجاح. يوم سعيد!',
        'icon': Icons.exit_to_app,
        'color': AppColors.secondary,
        'time': 'أمس، 04:55 م',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('التنبيهات'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('تحديد الكل كمقروء', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: mockNotifications.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = mockNotifications[index];
                return AppCard(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: (item['color'] as Color).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(item['icon'] as IconData, color: item['color'] as Color, size: 24),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item['title'] as String,
                                  style: AppTypography.headlineArabic.copyWith(fontSize: 16),
                                ),
                                Text(
                                  item['time'] as String,
                                  style: AppTypography.bodyArabic.copyWith(fontSize: 11, color: AppColors.onSurfaceVariant),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['body'] as String,
                              style: AppTypography.bodyArabic.copyWith(fontSize: 13, color: AppColors.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'جميع الحقوق محفوظة @2026 فؤاد الأصبحي',
              style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
