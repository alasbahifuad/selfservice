import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';

class ManagerAlertsScreen extends StatelessWidget {
  const ManagerAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mockAlerts = [
      {
        'employee': 'أحمد محمد',
        'date': '25 أكتوبر 2023',
        'type': 'تأخر في التسليم',
        'status': 'بانتظار المراجعة',
        'note': 'تم إرسال التنبيه الأول بخصوص تقرير مبيعات أكتوبر.',
      },
      {
        'employee': 'سارة خالد',
        'date': '22 أكتوبر 2023',
        'type': 'سلوك غير مهني',
        'status': 'تمت المعالجة',
        'note': 'تم عقد اجتماع لمناقشة التقرير المرفوع.',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('متابعة تنبيهات المدير'),
      ),
      body: Column(
        children: [
          // Export Actions
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Row(
              children: [
                _buildActionChip(Icons.table_view, 'تصدير Excel', Colors.green),
                const SizedBox(width: 12),
                _buildActionChip(Icons.picture_as_pdf, 'تصدير PDF', Colors.red),
                const Spacer(),
                const Icon(Icons.filter_list, color: AppColors.primary),
              ],
            ),
          ),
          
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: mockAlerts.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final alert = mockAlerts[index];
                return AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(alert['employee'], style: AppTypography.headlineArabic.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(alert['date'], style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _buildTypeBadge(alert['type']),
                          const SizedBox(width: 8),
                          _buildStatusBadge(alert['status']),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 12),
                      const Text('ملاحظة المدير:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      Text(alert['note'], style: const TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant)),
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

  Widget _buildActionChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(border: Border.all(color: color.withOpacity(0.3)), borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTypeBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: AppColors.error.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
      child: Text(text, style: const TextStyle(color: AppColors.error, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildStatusBadge(String text) {
    final color = text == 'تمت المعالجة' ? Colors.green : Colors.orange;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
      child: Text(text, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }
}
