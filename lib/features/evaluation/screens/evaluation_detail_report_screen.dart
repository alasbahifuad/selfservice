import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_button.dart';

class EvaluationDetailReportScreen extends StatelessWidget {
  const EvaluationDetailReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('تقرير التقييم التفصيلي'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.picture_as_pdf)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            AppCard(
              isHero: true,
              child: Column(
                children: [
                  const Text('أحمد محمد محمد', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  const Text('أكتوبر 2023', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildSummaryStat('النسبة الإجمالية', '92%'),
                      _buildSummaryStat('الدرجة النهائية', '4.6/5'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Meta Info
            AppCard(
              child: Column(
                children: [
                  _buildMetaRow('تاريخ التقييم', '28 أكتوبر 2023'),
                  _buildMetaRow('اسم المدير', 'فؤاد الأصبحي'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            Text('تفاصيل المعايير', style: AppTypography.headlineArabic.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            
            // Detailed Criteria
            AppCard(
              child: Column(
                children: [
                  _buildCriteriaRow('الالتزام بالمواعيد', 5, 'استثنائي', '20%'),
                  const Divider(),
                  _buildCriteriaRow('جودة المخرجات', 4, 'يفوق التوقعات', '30%'),
                  const Divider(),
                  _buildCriteriaRow('التعاون الجماعي', 4, 'يفوق التوقعات', '20%'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Notes & Alerts
            Text('ملاحظات وتنبيهات', style: AppTypography.headlineArabic.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('ملاحظة المدير:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('أداء متميز جداً هذا الشهر، استمر على هذا المستوى.', style: TextStyle(color: AppColors.onSurfaceVariant)),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.orange.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      children: [
                        Icon(Icons.warning_amber_rounded, color: Colors.orange),
                        SizedBox(width: 8),
                        Text('تنبيه: تأخر في تسليم تقرير واحد.', style: TextStyle(color: Colors.orange, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Attachments Preview Link
            AppButton(
              text: 'عرض المرفقات المرتبطة (3)',
              type: AppButtonType.secondary,
              icon: Icons.attach_file,
              onPressed: () {},
            ),
            
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

  Widget _buildSummaryStat(String label, String val) {
    return Column(
      children: [
        Text(val, style: AppTypography.headlineLatin.copyWith(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.white70)),
      ],
    );
  }

  Widget _buildMetaRow(String label, String val) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.onSurfaceVariant)),
          Text(val, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildCriteriaRow(String name, int stars, String meaning, String weight) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(weight, style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              ...List.generate(5, (i) => Icon(i < stars ? Icons.star : Icons.star_border, color: i < stars ? Colors.amber : Colors.grey, size: 16)),
              const SizedBox(width: 8),
              Text(meaning, style: const TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
