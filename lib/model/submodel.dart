// To parse this JSON data, do
//
//     final sub = subFromJson(jsonString);

import 'dart:convert';

List<Sub> subFromJson(String str) => List<Sub>.from(json.decode(str).map((x) => Sub.fromJson(x)));

String subToJson(List<Sub> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sub {
  String id;
  String name;
  String code;
  String orderIndex;
  String imgUrl;
  String imgUrlPath;
  String parentId;
  String parent;
  String tType;
  String remarks;
  String active;
  String companyId;
  String branchId;
  String faId;
  String userId;
  String updateDate;
  String isDelete;

  Sub({
    required this.id,
    required this.name,
    required this.code,
    required this.orderIndex,
    required this.imgUrl,
    required this.imgUrlPath,
    required this.parentId,
    required this.parent,
    required this.tType,
    required this.remarks,
    required this.active,
    required this.companyId,
    required this.branchId,
    required this.faId,
    required this.userId,
    required this.updateDate,
    required this.isDelete,
  });

  factory Sub.fromJson(Map<String, dynamic> json) => Sub(
    id: json["Id"],
    name: json["Name"],
    code: json["Code"],
    orderIndex: json["OrderIndex"],
    imgUrl: json["ImgUrl"],
    imgUrlPath: json["ImgUrlPath"],
    parentId: json["ParentId"],
    parent: json["Parent"],
    tType: json["TType"],
    remarks: json["Remarks"],
    active: json["Active"],
    companyId: json["CompanyId"],
    branchId: json["BranchId"],
    faId: json["FaId"],
    userId: json["UserId"],
    updateDate: json["UpdateDate"],
    isDelete: json["IsDelete"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Code": code,
    "OrderIndex": orderIndex,
    "ImgUrl": imgUrl,
    "ImgUrlPath": imgUrlPath,
    "ParentId": parentId,
    "Parent": parent,
    "TType": tType,
    "Remarks": remarks,
    "Active": active,
    "CompanyId": companyId,
    "BranchId": branchId,
    "FaId": faId,
    "UserId": userId,
    "UpdateDate": updateDate,
    "IsDelete": isDelete,
  };
}
