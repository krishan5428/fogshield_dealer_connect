import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/state/profile_state.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier();
});

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier()
      : super(ProfileState(
    name: 'ABC Company',
    email: 'abc@dealership.com',
    phone: '9876543210',
    companyName: 'ABC Automobile Solutions',
    address: '123, Dealer Hub, Sector 18, Gurugram',
    profileImage: null, // Initial placeholder
  ));

  void updateProfile({
    String? name,
    String? email,
    String? phone,
    String? companyName,
    String? address,
    String? profileImage,
  }) {
    state = state.copyWith(
      name: name,
      email: email,
      phone: phone,
      companyName: companyName,
      address: address,
      profileImage: profileImage,
    );
  }

  void updateImage(String path) {
    state = state.copyWith(profileImage: path);
  }
}