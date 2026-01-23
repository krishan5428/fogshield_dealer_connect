class ProfileState {
  final String name;
  final String email;
  final String phone;
  final String companyName;
  final String address;
  final String? profileImage; // Stores the local path or URL

  ProfileState({
    required this.name,
    required this.email,
    required this.phone,
    required this.companyName,
    required this.address,
    this.profileImage,
  });

  ProfileState copyWith({
    String? name,
    String? email,
    String? phone,
    String? companyName,
    String? address,
    String? profileImage,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      companyName: companyName ?? this.companyName,
      address: address ?? this.address,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}