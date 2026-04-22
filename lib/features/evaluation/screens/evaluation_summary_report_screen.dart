import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';

class EvaluationSummaryReportScreen extends StatelessWidget {
  const EvaluationSummaryReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('تقرير التقييم الإجمالي'),
      ),
      body: Column(
        children: [
          // Filter Tabs
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            color: AppColors.surfaceContainerLowest,
            child: Row(
              children: [
                _buildTab('ملخص شهري', true),
                const SizedBox(width: 12),
                _buildTab('ملخص سنوي', false),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Overall Management Score
                  AppCard(
                    isHero: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('النسبة الإجمالية للإدارة', style: TextStyle(color: Colors.white70)),
                            SizedBox(height: 4),
                            Text('88.5%', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
                          child: const Icon(Icons.analytics, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Chart Placeholder
                  AppCard(
                    child: Column(
                      children: [
                        const Text('توزيع التقييمات - أكتوبر 2023', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        Container(
                          height: 150,
                          width: double.infinity,
                          color: AppColors.surfaceContainerLow,
                          child: const Center(child: Icon(Icons.bar_chart, size: 48, color: AppColors.onSurfaceVariant)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  Text('قائمة الموظفين', style: AppTypography.headlineArabic.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  
                  // Employee List
                  AppCard(
                    padding: EdgeInsets.zero,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      separatorBuilder: (context, index) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final names = ['أحمد محمد', 'سارة خالد', 'ياسين علي', 'منى إبراهيم'];
                        final scores = ['92%', '85%', '78%', '95%'];
                        return ListTile(
                          title: Text(names[index], style: const TextStyle(fontSize: 14)),
                          trailing: Text(scores[index], style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                          onTap: () => context.push('/evaluation-detail'),
                        );
                      },
                    ),
                  ),
                ],
              ),
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

  Widget _buildTab(String label, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: active ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: active ? AppColors.primary : AppColors.outlineVariant),
      ),
      child: Text(label, style: TextStyle(color: active ? Colors.white : AppColors.onSurfaceVariant, fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }
}
