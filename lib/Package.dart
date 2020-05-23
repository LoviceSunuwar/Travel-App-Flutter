class Package {
  String packageID;
  String packageName;
  String detail;
  String price;
  String packageImage;
  String userEmail;

  Package(
      {this.packageID,
      this.packageName,
      this.detail,
      this.price,
      this.packageImage,
      this.userEmail});

  Package.fromJson(Map<String, dynamic> json) {
    packageID = json['Package_ID'];
    packageName = json['PackageName'];
    detail = json['Detail'];
    price = json['Price'];
    packageImage = "http://10.0.2.2:81/api_travelagentfyp//uploads/package"+ json['PackageImage'];
    userEmail = json['UserEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Package_ID'] = this.packageID;
    data['PackageName'] = this.packageName;
    data['Detail'] = this.detail;
    data['Price'] = this.price;
    data['PackageImage'] = this.packageImage;
    data['UserEmail'] = this.userEmail;
    return data;
  }
}