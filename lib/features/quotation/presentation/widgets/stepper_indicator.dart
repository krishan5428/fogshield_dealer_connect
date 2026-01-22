import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class StepperIndicator extends StatelessWidget {
  final int currentStep;

  const StepperIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final steps = ['Customer', 'Products', 'Cart', 'Review'];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      color: AppColors.lightGrey.withOpacity(0.3),
      child: Row(
        children: List.generate(steps.length, (index) {
          final isCompleted = index < currentStep - 1;
          final isActive = index == currentStep - 1;

          return Expanded(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? AppColors.connectionGreen
                            : isActive
                            ? AppColors.colorCompanyPrimary
                            : AppColors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: isCompleted
                            ? const Icon(Icons.check, size: 16, color: Colors.white)
                            : Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      steps[index],
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                        color: isActive ? AppColors.black : AppColors.disabledGrey,
                      ),
                    ),
                  ],
                ),
                if (index != steps.length - 1)
                  Expanded(
                    child: Container(
                      height: 2,
                      margin: const EdgeInsets.only(bottom: 18),
                      color: index < currentStep - 1
                          ? AppColors.connectionGreen
                          : AppColors.grey,
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}