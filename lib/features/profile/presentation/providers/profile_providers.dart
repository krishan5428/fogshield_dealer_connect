import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/utils/storage_service.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/state/profile_state.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier();
});

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier()
      : super(ProfileState(
    name: 'Loading...',
    email: '',
    phone: '',
    companyName: '',
    address: '',
    dealerId: '...',
    gstNumber: '',
    profileImage: null,
  )) {
    // Load persisted data on initialization
    loadPersistedProfile();
  }

  /// Loads profile data from Secure Storage
  Future<void> loadPersistedProfile() async {
    final data = await SecureStorageService.getProfileData();

    // Only update if we actually have saved data
    if (data['name'] != null) {
      state = state.copyWith(
        name: data['name'],
        email: data['email'],
        phone: data['phone'],
        companyName: data['company'],
        address: data['address'],
        gstNumber: data['gst'],
        dealerId: data['dealerId'],
      );
    } else {
      // Fallback to defaults if no storage found
      state = state.copyWith(name: 'New Dealer');
    }
  }

  /// Updates profile in memory AND persists it to Secure Storage
  Future<void> updateProfile({
    String? name,
    String? email,
    String? phone,
    String? companyName,
    String? address,
    String? dealerId,
    String? gstNumber,
    String? profileImage,
  }) async {
    // Update memory state
    state = state.copyWith(
      name: name,
      email: email,
      phone: phone,
      companyName: companyName,
      address: address,
      dealerId: dealerId,
      gstNumber: gstNumber,
      profileImage: profileImage,
    );

    // Persist to Secure Storage
    await SecureStorageService.saveProfileData(
      name: state.name,
      email: state.email,
      phone: state.phone,
      company: state.companyName,
      address: state.address,
      gst: state.gstNumber,
      dealerId: state.dealerId,
    );
  }

  void updateImage(String path) {
    // Use updateProfile to trigger persistence/state update cleanly
    updateProfile(profileImage: path);
  }
}