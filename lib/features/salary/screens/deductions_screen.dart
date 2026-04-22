import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';

class DeductionsScreen extends StatelessWidget {
  const DeductionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> deductions = [
      {'title': 'قرض', 'amount': '500.00', 'date': '15 أكتوبر'},
      {'title': 'ضريبة', 'amount': '250.00', 'date': '28 أكتوبر'},
      {'title': 'غياب', 'amount': '120.00', 'date': '12 أكتوبر'},
      {'title': 'تأخير', 'amount': '45.00', 'date': '05 أكتوبر'},
      {'title': 'انصراف مبكر', 'amount': '30.00', 'date': '20 أكتوبر'},
      {'title': 'سلفة', 'amount': '1000.00', 'date': '01 أكتوبر'},
      {'title': 'جزاءات إدارية', 'amount': '150.00', 'date': '22 أكتوبر'},
      {'title': 'تأمين', 'amount': '320.00', 'date': '01 أكتوبر'},
      {'title': 'استقطاعات أخرى', 'amount': '50.00', 'date': '30 أكتوبر'},
    ];

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('سجل الخصومات والاستقطاعات'),
      ),
      body: Column(
        children: [
          // Summary Header
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('إجمالي الاستقطاعات', style: TextStyle(color: Colors.white70)),
                    Text(
                      '2,465.00 ر.س',
                      style: AppTypography.headlineLatin.copyWith(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Icon(Icons.receipt_long_outlined, color: Colors.white24, size: 48),
              ],
            ),
          ),
          
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: deductions.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = deductions[index];
                return AppCard(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.error.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.remove_circle_outline, color: AppColors.error, size: 20),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['title'], style: AppTypography.headlineArabic.copyWith(fontSize: 16)),
                              Text(item['date'], style: AppTypography.bodyArabic.copyWith(fontSize: 12, color: AppColors.onSurfaceVariant)),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        '- ${item['amount']} ر.س',
                        style: AppTypography.headlineLatin.copyWith(fontSize: 16, color: AppColors.error, fontWeight: FontWeight.bold),
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
