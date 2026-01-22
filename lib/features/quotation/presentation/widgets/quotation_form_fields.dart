import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_text_field.dart';
import 'package:fogshield_dealer_connect/core/widgets/section_header.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/address_input.dart';
import 'package:fogshield_dealer_connect/core/utils/validators.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class QuotationFormFields extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const QuotationFormFields({super.key, required this.formKey});

  @override
  State<QuotationFormFields> createState() => _QuotationFormFieldsState();
}

class _QuotationFormFieldsState extends State<QuotationFormFields> {
  bool _sameAsBilling = true;
  String? _billingState;
  String? _shippingState;

  // Controllers
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyController = TextEditingController();
  final _bAddrController = TextEditingController();
  final _bCityController = TextEditingController();
  final _bPincodeController = TextEditingController();
  final _sAddrController = TextEditingController();
  final _sCityController = TextEditingController();
  final _sPincodeController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _companyController.dispose();
    _bAddrController.dispose();
    _bCityController.dispose();
    _bPincodeController.dispose();
    _sAddrController.dispose();
    _sCityController.dispose();
    _sPincodeController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Customer Basic Info', icon: Icons.person_outline),
          CustomTextField(
            label: 'Customer Name',
            hint: 'Enter full name',
            controller: _nameController,
            prefixIcon: Icons.person_pin_outlined,
            validator: (v) => Validators.required(v, fieldName: 'Name'),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Mobile Number',
            hint: '10 digit number',
            controller: _phoneController,
            prefixIcon: Icons.phone_android_rounded,
            keyboardType: TextInputType.phone,
            validator: Validators.phone,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Email Address (Optional)',
            hint: 'customer@email.com',
            controller: _emailController,
            prefixIcon: Icons.alternate_email_rounded,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Company Name (Optional)',
            hint: 'Enter business name',
            controller: _companyController,
            prefixIcon: Icons.business_rounded,
          ),

          const SectionHeader(title: 'Billing Address', icon: Icons.location_on_outlined, showDivider: true),
          AddressInput(
            label: 'Billing',
            addressController: _bAddrController,
            cityController: _bCityController,
            pincodeController: _bPincodeController,
            selectedState: _billingState,
            onStateChanged: (val) => setState(() => _billingState = val),
          ),

          const SizedBox(height: 16),
          CheckboxListTile(
            value: _sameAsBilling,
            onChanged: (val) => setState(() => _sameAsBilling = val ?? true),
            title: const Text('Shipping address same as billing'),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            activeColor: AppColors.colorCompanyPrimary,
          ),

          if (!_sameAsBilling) ...[
            const SectionHeader(title: 'Shipping Address', icon: Icons.local_shipping_outlined),
            AddressInput(
              label: 'Shipping',
              addressController: _sAddrController,
              cityController: _sCityController,
              pincodeController: _sPincodeController,
              selectedState: _shippingState,
              onStateChanged: (val) => setState(() => _shippingState = val),
            ),
          ],

          const SectionHeader(title: 'Additional Notes', icon: Icons.note_add_outlined, showDivider: true),
          CustomTextField(
            label: 'Special Instructions',
            hint: 'Any specific requirements or notes...',
            controller: _notesController,
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}