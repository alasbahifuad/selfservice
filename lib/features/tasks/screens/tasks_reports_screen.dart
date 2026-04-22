import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';

class TasksReportsScreen extends StatelessWidget {
  const TasksReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('تقارير المهام'),
      ),
      body: Column(
        children: [
          // Header with stats
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStat('إجمالي المهام', '12'),
                _buildStat('مكتملة', '8'),
                _buildStat('متأخرة', '2'),
              ],
            ),
          ),
          
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _buildReportCard(index);
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

  Widget _buildStat(String label, String val) {
    return Column(
      children: [
        Text(val, style: AppTypography.headlineLatin.copyWith(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.white70)),
      ],
    );
  }

  Widget _buildReportCard(int index) {
    final titles = ['تقرير الإنجاز الأسبوعي', 'تحليل عبء العمل القسمي', 'سجل المهام المتأخرة'];
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titles[index], style: AppTypography.headlineArabic.copyWith(fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildExportButton(Icons.picture_as_pdf, 'PDF', Colors.red),
              const SizedBox(width: 12),
              _buildExportButton(Icons.table_view, 'Excel', Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExportButton(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
