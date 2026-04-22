import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/status_badge.dart';

class LeavesScreen extends StatelessWidget {
  const LeavesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('إدارة الإجازات'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Hero
            AppCard(
              isHero: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'رصيد الإجازات المتاح',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '24 يوم',
                        style: AppTypography.headlineArabic.copyWith(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.event_available, size: 48, color: Colors.white24),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            AppButton(
              text: 'طلب إجازة جديدة',
              icon: Icons.add,
              onPressed: () {},
            ),
            const SizedBox(height: 32),
            
            Text(
              'سجل الطلبات السابقة',
              style: AppTypography.headlineArabic.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            // List of leaves
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _buildLeaveItem(index);
              },
            ),
            
            const SizedBox(height: 40),
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

  Widget _buildLeaveItem(int index) {
    final titles = ['إجازة سنوية', 'إجازة مرضية', 'إجازة اضطرارية'];
    final dates = ['10 - 15 أكتوبر 2023', '05 - 06 سبتمبر 2023', '12 - 12 أغسطس 2023'];
    final status = [StatusType.approved, StatusType.pending, StatusType.rejected];
    
    return AppCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.calendar_month, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titles[index],
                  style: AppTypography.headlineArabic.copyWith(fontSize: 16),
                ),
                Text(
                  dates[index],
                  style: AppTypography.bodyArabic.copyWith(fontSize: 12, color: AppColors.onSurfaceVariant),
                ),
              ],
            ),
          ),
          StatusBadge(type: status[index]),
        ],
      ),
    );
  }
}
