class ProfileState {
  final String userId; // Internal Database ID
  final String name;
  final String email;
  final String phone;
  final String companyName;
  final String address;
  final String dealerId; // Display ID (e.g. Code)
  final String gstNumber;
  final String? profileImage;

  ProfileState({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.companyName,
    required this.address,
    required this.dealerId,
    required this.gstNumber,
    this.profileImage,
  });

  ProfileState copyWith({
    String? userId,
    String? name,
    String? email,
    String? phone,
    String? companyName,
    String? address,
    String? dealerId,
    String? gstNumber,
    String? profileImage,
  }) {
    return ProfileState(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      companyName: companyName ?? this.companyName,
      address: address ?? this.address,
      dealerId: dealerId ?? this.dealerId,
      gstNumber: gstNumber ?? this.gstNumber,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}