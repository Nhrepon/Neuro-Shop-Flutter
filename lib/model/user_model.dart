class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String avatarUrl;
  final String city;

  UserModel(
      {required this.id, required this.firstName, required this.lastName, required this.email, required this.phone, required this.avatarUrl, required this.city});

  factory UserModel.fromJson(Map<String, dynamic> jsonData){
    return UserModel(
        id: jsonData['_id'],
        firstName: jsonData['first_name'] ?? 'Unknown',
        lastName: jsonData['last_name'] ?? 'Unknown',
        email: jsonData['email'],
        phone: jsonData['phone'] ?? 'Unknown',
        avatarUrl: jsonData['avatar_url'] ?? '',
        city: jsonData['city'] ?? 'Unknown');
  }


  Map<String, dynamic> toJson(){
    return {
      "_id":id,
      "first_name":firstName,
      "last_name":lastName,
      "email":email,
      "phone":phone,
      "avatar_url":avatarUrl,
      "city":city,
    };
}


}