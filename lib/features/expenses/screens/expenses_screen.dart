import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mockExpenses = [
      {
        'date': '22 أكتوبر 2023',
        'type': 'مصروفات تشغيلية',
        'category': 'انتداب خارجي',
        'amount': '1,250.00',
        'method': 'بطاقة الشركة',
        'description': 'زيارة ميدانية لفرع جدة لمراجعة المخزون.',
        'notes': 'تم إرفاق الفواتير الأصلية.',
      },
      {
        'date': '15 أكتوبر 2023',
        'type': 'نثريات',
        'category': 'ضيافة',
        'amount': '320.00',
        'method': 'نقدي (مطالبة)',
        'description': 'اجتماع اللجنة التوجيهية للربع الثالث.',
        'notes': 'تحتاج موافقة المدير المالي.',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('مصروفاتي وحساباتي'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: mockExpenses.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final expense = mockExpenses[index];
                return AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            expense['category'],
                            style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          Text(
                            '${expense['amount']} ر.س',
                            style: AppTypography.headlineLatin.copyWith(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.onSurface),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        expense['description'],
                        style: AppTypography.bodyArabic.copyWith(fontSize: 14),
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoColumn('التاريخ', expense['date']),
                          _buildInfoColumn('طريقة الدفع', expense['method']),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoColumn('النوع', expense['type']),
                          if (expense['notes'].isNotEmpty)
                            _buildInfoColumn('ملاحظات', expense['notes']),
                        ],
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

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
        Text(value, style: AppTypography.bodyArabic.copyWith(fontSize: 13, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
