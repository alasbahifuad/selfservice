import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mockTasks = [
      {
        'title': 'تحديث بيانات الموظفين',
        'description': 'مراجعة وتحديث ملفات الموظفين الجدد في نظام SAP.',
        'start': '20 أكتوبر',
        'due': '25 أكتوبر',
        'priority': 'عالية',
        'status': 'قيد التنفيذ',
        'notes': 'تحتاج مراجعة من المدير المالي.',
      },
      {
        'title': 'إعداد تقرير الرواتب',
        'description': 'تجهيز مسودة تقرير الرواتب لشهر أكتوبر.',
        'start': '15 أكتوبر',
        'due': '28 أكتوبر',
        'priority': 'متوسطة',
        'status': 'مكتملة',
        'notes': 'تم التدقيق الأولي.',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('مهامي الحالية'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: mockTasks.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final task = mockTasks[index];
                return AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getPriorityColor(task['priority']).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              task['priority'],
                              style: TextStyle(color: _getPriorityColor(task['priority']), fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(task['status'], style: const TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        task['title'],
                        style: AppTypography.headlineArabic.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        task['description'],
                        style: AppTypography.bodyArabic.copyWith(fontSize: 14, color: AppColors.onSurfaceVariant),
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoColumn('تاريخ البدء', task['start']),
                          _buildInfoColumn('تاريخ التسليم', task['due']),
                        ],
                      ),
                      if (task['notes'].isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.note_alt_outlined, size: 16, color: AppColors.onSurfaceVariant),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  task['notes'],
                                  style: AppTypography.bodyArabic.copyWith(fontSize: 12, color: AppColors.onSurfaceVariant),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

  Color _getPriorityColor(String p) {
    if (p == 'عالية') return Colors.red;
    if (p == 'متوسطة') return Colors.orange;
    return Colors.green;
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
        Text(value, style: AppTypography.headlineLatin.copyWith(fontSize: 13, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
