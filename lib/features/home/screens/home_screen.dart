import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(
          'بوابة الخدمة الذاتية',
          style: AppTypography.headlineArabic.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.push('/notifications'),
            icon: const Icon(Icons.notifications_none),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=123'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Hero Section
            AppCard(
              isHero: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مرحباً أحمد،',
                    style: AppTypography.headlineArabic.copyWith(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'إليك نظرة عامة على نشاطك لهذا اليوم.',
                    style: AppTypography.bodyArabic.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Stats Section Header
            Text(
              'إحصائيات اليوم',
              style: AppTypography.headlineArabic.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            
            // Stats Bento Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.3,
              children: [
                InkWell(
                  onTap: () => context.push('/attendance'),
                  borderRadius: BorderRadius.circular(24),
                  child: const StatCard(
                    title: 'حاضر اليوم',
                    value: 'نعم',
                    icon: Icons.how_to_reg,
                    color: AppColors.secondary,
                  ),
                ),
                StatCard(
                  title: 'متأخر اليوم',
                  value: '15 دقيقة',
                  icon: Icons.schedule,
                  color: AppColors.error,
                ),
                StatCard(
                  title: 'غائب اليوم',
                  value: 'لا',
                  icon: Icons.event_busy,
                  color: AppColors.onSurfaceVariant,
                ),
                StatCard(
                  title: 'إجمالي الخصومات',
                  value: '120 ر.س',
                  icon: Icons.account_balance_wallet,
                  color: AppColors.tertiary,
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Shortcuts Header
            Text(
              'اختصارات سريعة',
              style: AppTypography.headlineArabic.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            
            // Shortcuts
            ShortcutCard(
              title: 'تسجيل الحضور',
              subtitle: 'تسجيل الحضور والانصراف بالبصمة الذكية.',
              icon: Icons.fingerprint,
              color: AppColors.primary,
              onTap: () => context.push('/attendance'),
            ),
            const SizedBox(height: 16),
            ShortcutCard(
              title: 'طلبات الاستئذان',
              subtitle: 'تقديم طلب خروج قصير (بحد أقصى ساعتين).',
              icon: Icons.timer_outlined,
              color: AppColors.secondary,
              onTap: () => context.push('/permissions'),
            ),
            const SizedBox(height: 16),
            ShortcutCard(
              title: 'أثر الخصومات',
              subtitle: 'تحليل أثر الغياب والتأخير على الراتب.',
              icon: Icons.money_off,
              color: AppColors.error,
              onTap: () => context.push('/salary-impact'),
            ),
            const SizedBox(height: 16),
            ShortcutCard(
              title: 'مهامي الحالية',
              subtitle: 'متابعة المهام المسندة وحالة الإنجاز.',
              icon: Icons.task_alt,
              color: AppColors.tertiary,
              onTap: () => context.push('/tasks'),
            ),
            
            const SizedBox(height: 48),
            
            // Footer
            const Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 40,
                    child: Divider(color: AppColors.secondary, thickness: 2),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'جميع الحقوق محفوظة @2026 فؤاد الأصبحي',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surfaceContainerHighest,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(24)),
      ),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(24)),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=123'),
            ),
            accountName: Text(
              'أحمد محمد',
              style: AppTypography.headlineArabic.copyWith(color: Colors.white),
            ),
            accountEmail: const Text('موظف إداري | الرقم: 12345'),
          ),
          ListTile(
            leading: const Icon(Icons.fingerprint),
            title: const Text('تسجيل الحضور الذكي'),
            onTap: () => context.push('/attendance'),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('سجل الحضور والغياب'),
            onTap: () => context.push('/attendance-history'),
          ),
          ListTile(
            leading: const Icon(Icons.task_alt),
            title: const Text('مهامي'),
            onTap: () => context.push('/tasks'),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_outlined),
            title: const Text('المصروفات والحسابات'),
            onTap: () => context.push('/expenses'),
          ),
          ListTile(
            leading: const Icon(Icons.timer_outlined),
            title: const Text('طلبات الاستئذان'),
            onTap: () => context.push('/permissions'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.receipt_long_outlined),
            title: const Text('قسيمة الراتب'),
            onTap: () => context.push('/payslip'),
          ),
          ListTile(
            leading: const Icon(Icons.money_off_rounded),
            title: const Text('الخصومات'),
            onTap: () => context.push('/deductions'),
          ),
          ListTile(
            leading: const Icon(Icons.analytics_outlined),
            title: const Text('التقارير المالية'),
            onTap: () => context.push('/reports'),
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on_outlined),
            title: const Text('أثر الخصومات'),
            onTap: () => context.push('/salary-impact'),
          ),
          ListTile(
            leading: const Icon(Icons.pending_actions),
            title: const Text('الطلبات والإجازات'),
            onTap: () => context.push('/leaves'),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('الإعدادات'),
            onTap: () {},
          ),
          const Spacer(),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('الإدارة والتقييم (للمديرين)', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
          ),
          ListTile(
            leading: const Icon(Icons.rate_review_outlined),
            title: const Text('تقييم الموظفين'),
            onTap: () => context.push('/evaluation'),
          ),
          ListTile(
            leading: const Icon(Icons.settings_suggest_outlined),
            title: const Text('إعدادات المعايير'),
            onTap: () => context.push('/evaluation-settings'),
          ),
          ListTile(
            leading: const Icon(Icons.assignment_late_outlined),
            title: const Text('متابعة التنبيهات'),
            onTap: () => context.push('/manager-alerts'),
          ),
          ListTile(
            leading: const Icon(Icons.assessment_outlined),
            title: const Text('تقارير التقييم'),
            onTap: () => context.push('/evaluation-summary'),
          ),
          ListTile(
            leading: const Icon(Icons.attach_file_outlined),
            title: const Text('المرفقات'),
            onTap: () => context.push('/attachments'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.error),
            title: const Text('تسجيل الخروج', style: TextStyle(color: AppColors.error)),
            onTap: () => context.go('/login'),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.onSurfaceVariant,
            currentIndex: 0, // Placeholder
            onTap: (index) {
              if (index == 0) context.go('/home');
              if (index == 1) context.push('/attendance');
              if (index == 2) context.push('/attendance-history');
              if (index == 3) context.push('/notifications');
            },
            selectedLabelStyle: AppTypography.bodyArabic.copyWith(fontWeight: FontWeight.bold, fontSize: 11),
            unselectedLabelStyle: AppTypography.bodyArabic.copyWith(fontSize: 11),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined),
                activeIcon: Icon(Icons.dashboard),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fingerprint),
                label: 'الحضور',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'السجل',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none),
                label: 'التنبيهات',
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 12,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShortcutCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const ShortcutCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColors.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}
