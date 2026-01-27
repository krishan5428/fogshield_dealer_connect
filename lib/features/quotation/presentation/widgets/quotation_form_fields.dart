import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_text_field.dart';
import 'package:fogshield_dealer_connect/core/widgets/section_header.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/address_input.dart';
import 'package:fogshield_dealer_connect/core/utils/validators.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/providers/quotation_form_providers.dart';

class QuotationFormFields extends ConsumerStatefulWidget {
  final GlobalKey<FormState> formKey;
  const QuotationFormFields({super.key, required this.formKey});

  @override
  ConsumerState<QuotationFormFields> createState() => _QuotationFormFieldsState();
}

class _QuotationFormFieldsState extends ConsumerState<QuotationFormFields> {
  bool _sameAsBilling = true;
  String? _billingState;
  String? _shippingState;

  // Controllers
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _gstController;
  late TextEditingController _companyController;
  late TextEditingController _bAddrController;
  late TextEditingController _bCityController;
  late TextEditingController _bPincodeController;
  late TextEditingController _sAddrController;
  late TextEditingController _sCityController;
  late TextEditingController _sPincodeController;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    final state = ref.read(quotationFormProvider);

    // Pre-fill controllers from existing state
    _nameController = TextEditingController(text: state.customerName);
    _phoneController = TextEditingController(text: state.phoneNumber);
    _emailController = TextEditingController(text: state.email);
    _gstController = TextEditingController(text: state.gstNumber);
    _companyController = TextEditingController(text: state.companyName);
    _bAddrController = TextEditingController(text: state.billingAddress);
    _bCityController = TextEditingController(text: state.billingCity);
    _bPincodeController = TextEditingController(text: state.billingPincode);
    _sAddrController = TextEditingController(text: state.shippingAddress);
    _sCityController = TextEditingController(text: state.shippingCity);
    _sPincodeController = TextEditingController(text: state.shippingPincode);
    _notesController = TextEditingController(text: state.notes);

    _sameAsBilling = state.sameAsBilling;
    _billingState = state.billingState.isEmpty ? null : state.billingState;
    _shippingState = state.shippingState.isEmpty ? null : state.shippingState;

    // Add listeners to all controllers for Real-Time synchronization
    _nameController.addListener(_updateProvider);
    _phoneController.addListener(_updateProvider);
    _emailController.addListener(_updateProvider);
    _gstController.addListener(_updateProvider);
    _companyController.addListener(_updateProvider);
    _bAddrController.addListener(_updateProvider);
    _bCityController.addListener(_updateProvider);
    _bPincodeController.addListener(_updateProvider);
    _sAddrController.addListener(_updateProvider);
    _sCityController.addListener(_updateProvider);
    _sPincodeController.addListener(_updateProvider);
    _notesController.addListener(_updateProvider);
  }

  void _updateProvider() {
    ref.read(quotationFormProvider.notifier).updateField(
      name: _nameController.text,
      phone: _phoneController.text,
      email: _emailController.text,
      gst: _gstController.text,
      company: _companyController.text,
      bAddress: _bAddrController.text,
      bCity: _bCityController.text,
      bState: _billingState ?? '', // Use empty string to avoid null-block in copyWith
      bPincode: _bPincodeController.text,
      sameAsBilling: _sameAsBilling,
      sAddress: _sAddrController.text,
      sCity: _sCityController.text,
      sState: _shippingState ?? '',
      sPincode: _sPincodeController.text,
      notes: _notesController.text,
    );
  }

  @override
  void dispose() {
    // Dispose all controllers to prevent memory leaks
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _gstController.dispose();
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
            maxLength: 10,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
            label: 'GST Number (Optional)',
            hint: 'e.g. 07AAAAA0000A1Z5',
            controller: _gstController,
            prefixIcon: Icons.receipt_long_outlined,
            inputFormatters: [UpperCaseTextFormatter()],
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
            onStateChanged: (val) {
              setState(() => _billingState = val);
              _updateProvider();
            },
          ),

          const SizedBox(height: 16),
          CheckboxListTile(
            value: _sameAsBilling,
            onChanged: (val) {
              setState(() => _sameAsBilling = val ?? true);
              _updateProvider();
            },
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
              onStateChanged: (val) {
                setState(() => _shippingState = val);
                _updateProvider();
              },
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

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}