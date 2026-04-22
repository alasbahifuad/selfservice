import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('مركز التقارير'),
      ),
      body: Column(
        children: [
          // Filter Section
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تصفية التقارير',
                  style: AppTypography.headlineArabic.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildFilterChip('الكل', true),
                    _buildFilterChip('مالية', false),
                    _buildFilterChip('إدارية', false),
                    _buildFilterChip('أداء', false),
                  ],
                ),
              ],
            ),
          ),
          
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _buildReportCard(context, index);
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

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (val) {},
        backgroundColor: AppColors.surfaceContainerLow,
        selectedColor: AppColors.primaryContainer.withOpacity(0.2),
        labelStyle: TextStyle(color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant, fontSize: 12),
      ),
    );
  }

  Widget _buildReportCard(BuildContext context, int index) {
    final titles = [
      'تقرير كشف الرواتب التفصيلي',
      'سجل الحضور والانصراف الشهري',
      'كشف الإجازات المستهلكة والمتبقية',
      'تقرير تقييم الأداء الربعي',
      'بيان الاستقطاعات والجزاءات'
    ];
    final types = ['مالي', 'إداري', 'إداري', 'أداء', 'مالي'];
    
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
                  color: AppColors.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  types[index],
                  style: const TextStyle(color: AppColors.secondary, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              const Text('28 أكتوبر 2023', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 11)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            titles[index],
            style: AppTypography.headlineArabic.copyWith(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildExportButton(Icons.picture_as_pdf, 'PDF', Colors.red),
              const SizedBox(width: 12),
              _buildExportButton(Icons.table_view, 'Excel', Colors.green),
              const Spacer(),
              const Icon(Icons.visibility_outlined, color: AppColors.primary, size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExportButton(IconData icon, String label, Color color) {
    return InkWell(
      onTap: () {
        // Mock export placeholder
      },
      child: Container(
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
      ),
    );
  }
}
