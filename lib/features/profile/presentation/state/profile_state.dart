class ProfileState {
  final String name;
  final String email;
  final String phone;
  final String companyName;
  final String address;
  final String dealerId;
  final String gstNumber; // Added GST Number field
  final String? profileImage;

  ProfileState({
    required this.name,
    required this.email,
    required this.phone,
    required this.companyName,
    required this.address,
    required this.dealerId,
    required this.gstNumber, // Added to constructor
    this.profileImage,
  });

  ProfileState copyWith({
    String? name,
    String? email,
    String? phone,
    String? companyName,
    String? address,
    String? dealerId,
    String? gstNumber, // Added to copyWith
    String? profileImage,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      companyName: companyName ?? this.companyName,
      address: address ?? this.address,
      dealerId: dealerId ?? this.dealerId,
      gstNumber: gstNumber ?? this.gstNumber, // Map to field
      profileImage: profileImage ?? this.profileImage,
    );
  }
}