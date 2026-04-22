import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';

class ExpensesReportsScreen extends StatelessWidget {
  const ExpensesReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('تقارير المصروفات'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Cards
            Row(
              children: [
                Expanded(
                  child: _buildSummaryCard('إجمالي المصروفات', '5,420.00', Icons.account_balance_wallet, Colors.blue),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildSummaryCard('المطالبات المعلقة', '1,150.00', Icons.pending_actions, Colors.orange),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Visual Placeholder (Chart)
            Text(
              'توزيع المصروفات حسب التصنيف',
              style: AppTypography.headlineArabic.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            AppCard(
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.pie_chart_outline, size: 48, color: AppColors.onSurfaceVariant),
                      const SizedBox(height: 8),
                      Text('رسم بياني توضيحي (قيد التطوير)', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            
            // Filters
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'التقارير المتاحة',
                  style: AppTypography.headlineArabic.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.filter_list, color: AppColors.primary),
              ],
            ),
            const SizedBox(height: 16),
            
            // Report Cards
            _buildReportItem('كشف مصروفات الربع الثالث'),
            const SizedBox(height: 16),
            _buildReportItem('ملخص المطالبات النقدية المستردة'),
            
            const SizedBox(height: 48),
            const Center(
              child: Text(
                'جميع الحقوق محفوظة @2026 فؤاد الأصبحي',
                style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String label, String val, IconData icon, Color color) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 12),
          Text(val, style: AppTypography.headlineLatin.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
        ],
      ),
    );
  }

  Widget _buildReportItem(String title) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.headlineArabic.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
