class Profile {
  String profileID;
  String username;
  String email;
  String password;
  String loginLevel;
  String firstName;
  String lastName;
  Null agencyName;
  String address;
  String age;
  String contactno;
  Null panNo;
  Null licno;
  String about;
  String profileImage;
  Null points;
  String verified;

  Profile(
      {this.profileID,
      this.username,
      this.email,
      this.password,
      this.loginLevel,
      this.firstName,
      this.lastName,
      this.agencyName,
      this.address,
      this.age,
      this.contactno,
      this.panNo,
      this.licno,
      this.about,
      this.profileImage,
      this.points,
      this.verified});

  Profile.fromJson(Map<String, dynamic> json) {
    profileID = json['Profile_ID'];
    username = json['Username'];
    email = json['Email'];
    password = json['Password'];
    loginLevel = json['LoginLevel'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    agencyName = json['AgencyName'];
    address = json['Address'];
    age = json['Age'];
    contactno = json['Contactno'];
    panNo = json['PanNo'];
    licno = json['Licno'];
    about = json['About'];
    profileImage = json['ProfileImage'];
    points = json['Points'];
    verified = json['Verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Profile_ID'] = this.profileID;
    data['Username'] = this.username;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['LoginLevel'] = this.loginLevel;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['AgencyName'] = this.agencyName;
    data['Address'] = this.address;
    data['Age'] = this.age;
    data['Contactno'] = this.contactno;
    data['PanNo'] = this.panNo;
    data['Licno'] = this.licno;
    data['About'] = this.about;
    data['ProfileImage'] = this.profileImage;
    data['Points'] = this.points;
    data['Verified'] = this.verified;
    return data;
  }
}