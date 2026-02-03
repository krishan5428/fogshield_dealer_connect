import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_text_field.dart';
import 'package:fogshield_dealer_connect/core/widgets/dropdown_field.dart';
import 'package:fogshield_dealer_connect/core/utils/indian_states.dart';
import 'package:fogshield_dealer_connect/core/utils/validators.dart';

class AddressInput extends StatelessWidget {
  final String label;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController pincodeController;
  final String? selectedState;
  final Function(String?) onStateChanged;

  const AddressInput({
    super.key,
    required this.label,
    required this.addressController,
    required this.cityController,
    required this.pincodeController,
    required this.selectedState,
    required this.onStateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          label: '$label Address',
          hint: 'Street, Area, Building',
          controller: addressController,
          maxLines: 2,
          validator: (v) => Validators.required(v, fieldName: 'Address'),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomTextField(
                label: 'City',
                hint: 'City name',
                controller: cityController,
                validator: (v) => Validators.required(v, fieldName: 'City'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomTextField(
                label: 'Pincode',
                hint: '6 digits',
                controller: pincodeController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                  FilteringTextInputFormatter.digitsOnly,
                ],

                validator: (v) {
                  if (v == null || v.length != 6) return 'Invalid pincode';
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        DropdownField(
          label: 'State',
          hint: 'Select State',
          items: IndianStates.states,
          value: selectedState,
          onChanged: onStateChanged,
          validator: (v) => Validators.required(v, fieldName: 'State'),
        ),
      ],
    );
  }
}