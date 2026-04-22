import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_button.dart';

class PayslipScreen extends StatelessWidget {
  const PayslipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('قسيمة الراتب'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Month Selector Header
            AppCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back_ios, size: 16),
                  Text(
                    'أكتوبر 2023',
                    style: AppTypography.headlineArabic.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Net Salary Card
            AppCard(
              isHero: true,
              child: Column(
                children: [
                  const Text('صافي الراتب المستحق', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 8),
                  Text(
                    '8,750.00 ر.س',
                    style: AppTypography.headlineLatin.copyWith(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Detailed Breakdown
            _buildSection('الرواتب الأساسية', [
              _buildRow('الأجر الأساسي', '6,500.00'),
              _buildRow('بدل سكن', '1,625.00'),
              _buildRow('بدل مواصلات', '650.00'),
              _buildRow('الأجر الشامل', '8,775.00', isBold: true),
            ]),
            const SizedBox(height: 24),
            
            _buildSection('الاستحقاقات والإضافات', [
              _buildRow('إضافي (Overtime)', '1,200.00'),
              _buildRow('بدل انتداب', '450.00'),
              _buildRow('إجمالي الاستحقاقات', '1,650.00', isBold: true, color: Colors.green),
            ]),
            const SizedBox(height: 24),
            
            _buildSection('الخصومات والاستقطاعات', [
              _buildRow('تأمينات اجتماعية', '650.00'),
              _buildRow('غياب وتأخير', '125.00'),
              _buildRow('ضريبة الدخل', '900.00'),
              _buildRow('إجمالي الخصومات', '1,675.00', isBold: true, color: AppColors.error),
            ]),
            
            const SizedBox(height: 32),
            
            // Summary Card
            AppCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('صافي الراتب', style: AppTypography.headlineArabic.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                    '8,750.00 ر.س',
                    style: AppTypography.headlineLatin.copyWith(fontSize: 18, color: AppColors.primary, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: 'تحميل PDF',
                    icon: Icons.picture_as_pdf,
                    type: AppButtonType.secondary,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppButton(
                    text: 'مشاركة',
                    icon: Icons.share,
                    onPressed: () {},
                  ),
                ),
              ],
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

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.headlineArabic.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.onSurfaceVariant),
        ),
        const SizedBox(height: 12),
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildRow(String label, String value, {bool isBold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.bodyArabic.copyWith(fontSize: 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(
            '$value ر.س',
            style: AppTypography.headlineLatin.copyWith(
              fontSize: 14, 
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color ?? AppColors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
