import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'Apiclientservice.g.dart';

@RestApi(baseUrl: "https://official-joke-api.appspot.com")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
  @GET("/random_ten")
  Future<List<Jokes>> getTasks();
}

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class JsplaceClient {
  factory JsplaceClient(Dio dio) = _JsplaceClient;
  @GET("/posts")
  Future<List<Post>> getPosts();
  @POST("/posts")
  Future setPosts(@Body() Post data);
  @DELETE("/posts/{id}")
  Future deletePost(@Path("id") String id);
  @PUT("/posts/{id}")
  Future putPost(@Path("id") String id, @Body() Post data);
}

@RestApi(baseUrl: "https://reqres.in/api")
abstract class PhotoClient {
  factory PhotoClient(Dio dio) = _PhotoClient;
  @GET("/users/{id}")
  Future<Photo> getPhoto(@Path("id") String id);
}

@RestApi(baseUrl: "https://dummyjson.com/")
abstract class Client {
  factory Client(Dio dio) = _Client;
  @GET("/users")
  Future<UserListModel> getUser();
}

class Post {
  int? id;
  String? title;
  String? body;
  Post({this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) =>
      Post(id: json['id'], title: json['title'], body: json['body']);
  Map<String, dynamic> toJson() => {'id': id, "title": title, "body": body};
}

class Jokes {
  String? type;
  String? setup;
  int? id;
  String? punchline;

  Jokes({
    this.type,
    this.setup,
    this.id,
    this.punchline,
  });

  factory Jokes.fromJson(Map<String, dynamic> json) => Jokes(
      id: json['id'],
      type: json['type'],
      setup: json['setup'],
      punchline: json['punchline']);
  Map<String, dynamic> toJson() =>
      {'id': id, "type": type, "setup": setup, "punchline": punchline};
}

// import 'dart:convert';

Photo welcomeFromJson(String str) => Photo.fromJson(json.decode(str));

String welcomeToJson(Photo data) => json.encode(data.toJson());

class Photo {
  Data? data;
  Support? support;

  Photo({
    this.data,
    this.support,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        support:
            json["support"] == null ? null : Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "support": support?.toJson(),
      };
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class Support {
  String? url;
  String? text;

  Support({
    this.url,
    this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}

// To parse this JSON data, do
// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

UserListModel userListModelFromJson(String str) =>
    UserListModel.fromJson(json.decode(str));

String userListModelToJson(UserListModel data) => json.encode(data.toJson());

class UserListModel {
  List<User>? users;
  int? total;
  int? skip;
  int? limit;

  UserListModel({
    this.users,
    this.total,
    this.skip,
    this.limit,
  });

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
        users: json["users"] == null
            ? []
            : List<User>.from(json["users"]!.map((x) => User.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "users": users == null
            ? []
            : List<dynamic>.from(users!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  Gender? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  DateTime? birthDate;
  String? image;
  String? bloodGroup;
  int? height;
  double? weight;
  EyeColor? eyeColor;
  Hair? hair;
  String? domain;
  String? ip;
  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.domain,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        maidenName: json["maidenName"],
        age: json["age"],
        gender: genderValues.map[json["gender"]]!,
        email: json["email"],
        phone: json["phone"],
        username: json["username"],
        password: json["password"],
        birthDate: json["birthDate"] == null
            ? null
            : DateTime.parse(json["birthDate"]),
        image: json["image"],
        bloodGroup: json["bloodGroup"],
        height: json["height"],
        weight: json["weight"]?.toDouble(),
        eyeColor: eyeColorValues.map[json["eyeColor"]]!,
        hair: json["hair"] == null ? null : Hair.fromJson(json["hair"]),
        domain: json["domain"],
        ip: json["ip"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        macAddress: json["macAddress"],
        university: json["university"],
        bank: json["bank"] == null ? null : Bank.fromJson(json["bank"]),
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
        ein: json["ein"],
        ssn: json["ssn"],
        userAgent: json["userAgent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "maidenName": maidenName,
        "age": age,
        "gender": genderValues.reverse[gender],
        "email": email,
        "phone": phone,
        "username": username,
        "password": password,
        "birthDate":
            "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "image": image,
        "bloodGroup": bloodGroup,
        "height": height,
        "weight": weight,
        "eyeColor": eyeColorValues.reverse[eyeColor],
        "hair": hair?.toJson(),
        "domain": domain,
        "ip": ip,
        "address": address?.toJson(),
        "macAddress": macAddress,
        "university": university,
        "bank": bank?.toJson(),
        "company": company?.toJson(),
        "ein": ein,
        "ssn": ssn,
        "userAgent": userAgent,
      };
}

class Address {
  String? address;
  String? city;
  Coordinates? coordinates;
  String? postalCode;
  String? state;

  Address({
    this.address,
    this.city,
    this.coordinates,
    this.postalCode,
    this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        city: json["city"],
        coordinates: json["coordinates"] == null
            ? null
            : Coordinates.fromJson(json["coordinates"]),
        postalCode: json["postalCode"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "coordinates": coordinates?.toJson(),
        "postalCode": postalCode,
        "state": state,
      };
}

class Coordinates {
  double? lat;
  double? lng;

  Coordinates({
    this.lat,
    this.lng,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Bank {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  Bank({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        cardExpire: json["cardExpire"],
        cardNumber: json["cardNumber"],
        cardType: json["cardType"],
        currency: json["currency"],
        iban: json["iban"],
      );

  Map<String, dynamic> toJson() => {
        "cardExpire": cardExpire,
        "cardNumber": cardNumber,
        "cardType": cardType,
        "currency": currency,
        "iban": iban,
      };
}

class Company {
  Address? address;
  String? department;
  String? name;
  String? title;

  Company({
    this.address,
    this.department,
    this.name,
    this.title,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        department: json["department"],
        name: json["name"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "address": address?.toJson(),
        "department": department,
        "name": name,
        "title": title,
      };
}

enum EyeColor { AMBER, BLUE, BROWN, GRAY, GREEN }

final eyeColorValues = EnumValues({
  "Amber": EyeColor.AMBER,
  "Blue": EyeColor.BLUE,
  "Brown": EyeColor.BROWN,
  "Gray": EyeColor.GRAY,
  "Green": EyeColor.GREEN
});

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({"female": Gender.FEMALE, "male": Gender.MALE});

class Hair {
  Color? color;
  Type? type;

  Hair({
    this.color,
    this.type,
  });

  factory Hair.fromJson(Map<String, dynamic> json) => Hair(
        color: colorValues.map[json["color"]]!,
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "color": colorValues.reverse[color],
        "type": typeValues.reverse[type],
      };
}

enum Color { AUBURN, BLACK, BLOND, BROWN, CHESTNUT }

final colorValues = EnumValues({
  "Auburn": Color.AUBURN,
  "Black": Color.BLACK,
  "Blond": Color.BLOND,
  "Brown": Color.BROWN,
  "Chestnut": Color.CHESTNUT
});

enum Type { CURLY, STRAIGHT, STRANDS, VERY_CURLY, WAVY }

final typeValues = EnumValues({
  "Curly": Type.CURLY,
  "Straight": Type.STRAIGHT,
  "Strands": Type.STRANDS,
  "Very curly": Type.VERY_CURLY,
  "Wavy": Type.WAVY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
