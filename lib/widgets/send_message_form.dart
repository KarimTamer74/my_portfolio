import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/app_strings.dart';
import 'package:my_portfolio/utils/app_styles.dart';
import 'package:my_portfolio/widgets/form_label.dart';

class SendMessageForm extends StatefulWidget {
  const SendMessageForm({super.key});

  @override
  State<SendMessageForm> createState() => _SendMessageFormState();
}

class _SendMessageFormState extends State<SendMessageForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSending = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      const String accessKey = '9e27953e-c79a-4a55-9975-eae856fbeba6';
      final url = Uri.parse('https://api.web3forms.com/submit');

      try {
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: json.encode({
            'access_key': accessKey,
            'name': _nameController.text,
            'email': _emailController.text,
            'message': _messageController.text,
            'subject': 'New message from your portfolio website!',
          }),
        );

        if (response.statusCode == 200 && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Message sent successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          _formKey.currentState!.reset();
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();
        } else {
          throw Exception(
            'Failed to send message with status code: ${response.statusCode}',
          );
        }
      } catch (e) {
        log('Error sending message: $e');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to send message. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isSending = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.sendMessage,
              style: AppStyles.s28W700.copyWith(
                color: isDark ? AppColors.textSecondary : AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 30),
            const FormLabel(text: AppStrings.yourName),
            TextFormField(
              controller: _nameController,
              // --- MODIFIED ---
              style: AppStyles.s16W400.copyWith(
                color: isDark ? AppColors.textSecondary : AppColors.textPrimary,
              ),
              decoration: const InputDecoration(
                hintText: AppStrings.yourEmailHint,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 25),
            const FormLabel(text: AppStrings.yourEmail),
            TextFormField(
              controller: _emailController,
              // --- MODIFIED ---
              style: AppStyles.s16W400.copyWith(
                color: isDark ? AppColors.textSecondary : AppColors.textPrimary,
              ),
              decoration: const InputDecoration(
                hintText: AppStrings.yourEmailHint,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return AppStrings.yourEmailError;
                }
                return null;
              },
            ),
            const SizedBox(height: 25),
            const FormLabel(text: AppStrings.message),
            TextFormField(
              controller: _messageController,
              maxLines: 5,
              // --- MODIFIED ---
              style: AppStyles.s16W400.copyWith(
                color: isDark ? AppColors.textSecondary : AppColors.textPrimary,
              ),
              decoration: const InputDecoration(
                hintText: AppStrings.yourMessageHint,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.yourMessageError;
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _isSending ? null : _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlueLight,
                foregroundColor: AppColors.white,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                // --- MODIFIED ---
                textStyle: AppStyles.s16W700.copyWith(color: AppColors.white),
              ),
              child:
                  _isSending
                      ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                          strokeWidth: 3,
                        ),
                      )
                      : const Text(AppStrings.sendMessage),
            ),
          ],
        ),
      ),
    );
  }
}
