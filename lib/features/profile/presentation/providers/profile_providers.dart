import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/services/data_sync_service.dart';
import 'package:fogshield_dealer_connect/core/utils/logger_service.dart';
import 'package:fogshield_dealer_connect/core/utils/storage_service.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/state/profile_state.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier(ref);
});

class ProfileNotifier extends StateNotifier<ProfileState> {
  final Ref _ref;

  ProfileNotifier(this._ref)
      : super(ProfileState(
    userId: '',
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
    try {
      final data = await SecureStorageService.getProfileData();
      LoggerService.d("👤 Loaded Persisted Profile: $data");

      // Only update if we actually have saved data
      if (data['name'] != null && data['name']!.isNotEmpty) {
        state = state.copyWith(
          userId: data['userId'],
          name: data['name'],
          email: data['email'],
          phone: data['phone'],
          companyName: data['company'],
          address: data['address'],
          gstNumber: data['gst'],
          dealerId: data['dealerId'],
        );
      } else {
        // Fallback: Only set 'New Dealer' if we are still in the initial 'Loading...' state.
        // This prevents overwriting valid data if updateProfile() was called (e.g. by Login)
        // before this async method finished.
        if (state.name == 'Loading...') {
          state = state.copyWith(name: 'New Dealer');
        }
      }
    } catch (e) {
      LoggerService.e("❌ Error loading profile persistence: $e", e);
      // Fallback on error so UI doesn't stick on 'Loading...'
      if (state.name == 'Loading...') {
        state = state.copyWith(name: 'New Dealer');
      }
    }
  }

  /// 3. Run on every new entry (Update)
  Future<void> updateProfile({
    String? userId, // ✅ Added userId parameter
    String? name,
    String? email,
    String? phone,
    String? companyName,
    String? address,
    String? dealerId,
    String? gstNumber,
    String? profileImage,
  }) async {
    LoggerService.i("🛠️ Updating Profile State with: ${name ?? 'No Name Change'}");
    // 1. Update memory
    state = state.copyWith(
      userId: userId, // ✅ Update userId in state
      name: name,
      email: email,
      phone: phone,
      companyName: companyName,
      address: address,
      dealerId: dealerId,
      gstNumber: gstNumber,
      profileImage: profileImage,
    );

    // 2. Persist to Storage
    await SecureStorageService.saveProfileData(
      userId: state.userId, // Uses the updated userId from state
      name: state.name,
      email: state.email,
      phone: state.phone,
      company: state.companyName,
      address: state.address,
      gst: state.gstNumber,
      dealerId: state.dealerId,
    );

    // 3. Mark as Dirty (Unsynced)
    await SecureStorageService.setProfileDirty(true);

    // 4. Attempt Sync immediately
    _ref.read(syncServiceProvider).syncUserProfile(state);
  }

  void updateImage(String path) {
    updateProfile(profileImage: path);
  }
}