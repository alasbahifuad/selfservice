import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_button.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool isInGeoZone = false;
  bool isCheckedIn = false;
  String currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    setState(() {
      currentTime = DateFormat('hh:mm:ss a', 'ar').format(DateTime.now());
    });
    Future.delayed(const Duration(seconds: 1), _updateTime);
  }

  void _toggleGeoZone() {
    setState(() {
      isInGeoZone = !isInGeoZone;
    });
  }

  void _handleAction() {
    setState(() {
      isCheckedIn = !isCheckedIn;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCheckedIn ? 'تم تسجيل الحضور بنجاح' : 'تم تسجيل الانصراف بنجاح'),
        backgroundColor: isCheckedIn ? Colors.green : Colors.orange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('الحضور والانصراف الذكي'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Time Display Card
            AppCard(
              isHero: true,
              child: Column(
                children: [
                  Text(
                    currentTime,
                    style: AppTypography.headlineLatin.copyWith(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    DateFormat('EEEE, d MMMM yyyy', 'ar').format(DateTime.now()),
                    style: AppTypography.bodyArabic.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Location Status
            AppCard(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: (isInGeoZone ? Colors.green : Colors.red).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isInGeoZone ? Icons.location_on : Icons.location_off,
                      color: isInGeoZone ? Colors.green : Colors.red,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isInGeoZone ? 'أنت داخل النطاق الجغرافي' : 'أنت خارج النطاق الجغرافي',
                          style: AppTypography.headlineArabic.copyWith(fontSize: 16),
                        ),
                        Text(
                          'الموقع: فرع الإدارة الرئيسي',
                          style: AppTypography.bodyArabic.copyWith(fontSize: 12, color: AppColors.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: isInGeoZone,
                    onChanged: (value) => _toggleGeoZone(),
                    activeTrackColor: AppColors.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            
            // Confirmation Message
            if (isInGeoZone)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.primary.withOpacity(0.1)),
                ),
                child: Column(
                  children: [
                    Text(
                      !isCheckedIn 
                        ? 'سيتم إجراء عملية حضورك الآن، يرجى التأكيد الآن؟'
                        : 'سيتم إجراء عملية انصرافك الآن، يرجى التأكيد الآن؟',
                      textAlign: TextAlign.center,
                      style: AppTypography.headlineArabic.copyWith(fontSize: 18, color: AppColors.primary),
                    ),
                    const SizedBox(height: 24),
                    AppButton(
                      text: !isCheckedIn ? 'تأكيد الحضور' : 'تأكيد الانصراف',
                      onPressed: _handleAction,
                    ),
                  ],
                ),
              )
            else
              const Center(
                child: Column(
                  children: [
                    Icon(Icons.info_outline, size: 48, color: AppColors.onSurfaceVariant),
                    SizedBox(height: 16),
                    Text(
                      'يجب أن تكون داخل النطاق الجغرافي لتتمكن من تسجيل الحضور أو الانصراف',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            
            const SizedBox(height: 60),
            const Text(
              'جميع الحقوق محفوظة @2026 فؤاد الأصبحي',
              style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
