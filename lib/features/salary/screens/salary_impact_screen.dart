import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';

class SalaryImpactScreen extends StatelessWidget {
  const SalaryImpactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('أثر الخصومات على الراتب'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Month Header
            Text(
              'تقرير شهر أكتوبر 2023',
              style: AppTypography.headlineArabic.copyWith(fontSize: 20, color: AppColors.primary),
            ),
            const SizedBox(height: 24),
            
            // Main Impact Card
            AppCard(
              isHero: true,
              child: Column(
                children: [
                  const Text(
                    'إجمالي الخصم لهذا الشهر',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '156.00 ر.س',
                    style: AppTypography.headlineLatin.copyWith(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Detailed Breakdown
            Text(
              'تفاصيل الاحتساب',
              style: AppTypography.headlineArabic.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            AppCard(
              child: Column(
                children: [
                  _buildDetailRow('الخصم الأساسي (غياب/تأخير)', '120.00 ر.س'),
                  const Divider(height: 32),
                  _buildDetailRow('الجزاء الإضافي (30%)', '36.00 ر.س', isHighlight: true),
                  const Divider(height: 32),
                  _buildDetailRow('إجمالي الخصم', '156.00 ر.س', isBold: true),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Note
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.error.withOpacity(0.1)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber_rounded, color: AppColors.error),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'يتم احتساب الجزاء الإضافي بناءً على سياسة الشركة للمخالفات المتكررة.',
                      style: AppTypography.bodyArabic.copyWith(fontSize: 13, color: AppColors.error),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 60),
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

  Widget _buildDetailRow(String label, String value, {bool isHighlight = false, bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTypography.bodyArabic.copyWith(
            fontSize: 15,
            color: isHighlight ? AppColors.error : AppColors.onSurface,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: AppTypography.headlineLatin.copyWith(
            fontSize: 16,
            color: isHighlight ? AppColors.error : AppColors.onSurface,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
