import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/status_badge.dart';

class AttendanceHistoryScreen extends StatelessWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('سجل الحضور'),
      ),
      body: Column(
        children: [
          // Month Selector
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildMonthChip('أكتوبر 2023', true),
                _buildMonthChip('سبتمبر 2023', false),
                _buildMonthChip('أغسطس 2023', false),
                _buildMonthChip('يوليو 2023', false),
              ],
            ),
          ),
          
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _buildAttendanceItem(index);
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

  Widget _buildMonthChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (val) {},
        selectedColor: AppColors.primaryContainer.withOpacity(0.2),
        labelStyle: TextStyle(
          color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildAttendanceItem(int index) {
    final status = index % 3 == 0 ? StatusType.present : (index % 3 == 1 ? StatusType.late : StatusType.absent);
    
    return AppCard(
      child: Row(
        children: [
          // Date Column
          Column(
            children: [
              Text(
                '${15 - index}',
                style: AppTypography.headlineLatin.copyWith(fontSize: 24, color: AppColors.primary),
              ),
              Text(
                'أكتوبر',
                style: AppTypography.bodyArabic.copyWith(fontSize: 12, color: AppColors.onSurfaceVariant),
              ),
            ],
          ),
          const SizedBox(width: 24),
          const VerticalDivider(),
          const SizedBox(width: 8),
          
          // Times and Status
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الدخول: 08:30 ص',
                      style: AppTypography.bodyArabic.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    StatusBadge(type: status),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'الخروج: 04:45 م',
                  style: AppTypography.bodyArabic.copyWith(fontSize: 13, color: AppColors.onSurfaceVariant),
                ),
                const SizedBox(height: 4),
                Text(
                  'الموقع: فرع الإدارة',
                  style: AppTypography.bodyArabic.copyWith(fontSize: 11, color: AppColors.onSurfaceVariant.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
