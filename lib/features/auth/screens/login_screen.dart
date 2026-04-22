import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _sapController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _handleLogin() async {
    if (_sapController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء إدخال كود الموظف (SAP)')),
      );
      return;
    }
    setState(() => _isLoading = true);
    // Simulate login
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isLoading = false);
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              // Logo
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.lock_person,
                  size: 40,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'تسجيل الدخول',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'قم بإدخال بياناتك للوصول إلى حسابك',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 48),
              // Form
              AppTextField(
                label: 'كود الموظف (SAP)',
                hint: 'أدخل كود SAP الخاص بك',
                prefixIcon: Icons.badge_outlined,
                controller: _sapController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              AppTextField(
                label: 'كلمة المرور',
                hint: 'أدخل كلمة المرور',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: AppButton(
                  text: 'نسيت كلمة المرور؟',
                  type: AppButtonType.text,
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 32),
              AppButton(
                text: 'دخول',
                isLoading: _isLoading,
                onPressed: _handleLogin,
              ),
              const SizedBox(height: 24),
              AppButton(
                text: 'تسجيل دخول كمسؤول',
                type: AppButtonType.secondary,
                onPressed: () {},
              ),
              const SizedBox(height: 60),
              const Text(
                'جميع الحقوق محفوظة @2026 فؤاد الأصبحي',
                style: TextStyle(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
