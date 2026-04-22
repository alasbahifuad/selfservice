import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/status_badge.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('طلبات الاستئذان'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Info Card
            AppCard(
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: AppColors.secondary, size: 32),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'يسمح لك بطلب استئذان لمدة لا تتجاوز ساعتين في اليوم الواحد.',
                      style: AppTypography.bodyArabic.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            AppButton(
              text: 'طلب استئذان جديد',
              icon: Icons.timer_outlined,
              type: AppButtonType.secondary,
              onPressed: () {},
            ),
            const SizedBox(height: 32),
            
            Text(
              'سجل الاستئذانات',
              style: AppTypography.headlineArabic.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            // List of permissions
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _buildPermissionItem(index);
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

  Widget _buildPermissionItem(int index) {
    final times = ['09:00 ص - 11:00 ص', '01:00 م - 02:30 م'];
    final dates = ['18 أكتوبر 2023', '10 أكتوبر 2023'];
    final status = [StatusType.approved, StatusType.approved];
    
    return AppCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.history_toggle_off, color: AppColors.secondary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  times[index],
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
