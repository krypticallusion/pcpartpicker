import 'dart:convert';

class BuildGuides {
  List<Categories> categories;

  BuildGuides({this.categories});

  BuildGuides.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String title;
  List<Guides> guides;

  Categories({this.title, this.guides});

  Categories.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['guides'] != null) {
      guides = new List<Guides>();
      json['guides'].forEach((v) {
        guides.add(new Guides.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.guides != null) {
      data['guides'] = this.guides.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Guides {
  String path;
  String title;
  List<String> products;
  String price;
  int comments;
  List<String> images;

  Guides({this.path,
    this.title,
    this.products,
    this.price,
    this.comments,
    this.images});

  Guides.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    title = json['title'];
    products = json['products'].cast<String>();
    price = json['price'];
    comments = json['comments'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['title'] = this.title;
    data['products'] = this.products;
    data['price'] = this.price;
    data['comments'] = this.comments;
    data['images'] = this.images;
    return data;
  }
}

class GuideDetails {
  GuideDetails({
    this.images,
    this.votes,
    this.partsLink,
    this.description,
  });

  final List<String> images;
  final int votes;
  final String partsLink;
  final Description description;

  factory GuideDetails.fromRawJson(String str) =>
      GuideDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GuideDetails.fromJson(Map<String, dynamic> json) =>
      GuideDetails(
        images: json["images"] == null ? null : List<String>.from(
            json["images"].map((x) => x)),
        votes: json["votes"] == null ? null : json["votes"],
        partsLink: json["parts_link"] == null ? null : json["parts_link"],
        description: json["description"] == null ? null : Description.fromJson(
            json["description"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "images": images == null ? null : List<dynamic>.from(
            images.map((x) => x)),
        "votes": votes == null ? null : votes,
        "parts_link": partsLink == null ? null : partsLink,
        "description": description == null ? null : description.toJson(),
      };
}

class Description {
  Description({
    this.cpu,
    this.motherboard,
    this.memory,
    this.storage,
    this.gpu,
    this.descriptionCase,
    this.psu,
  });

  final String cpu;
  final String motherboard;
  final String memory;
  final String storage;
  final String gpu;
  final String descriptionCase;
  final String psu;

  factory Description.fromRawJson(String str) =>
      Description.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Description.fromJson(Map<String, dynamic> json) =>
      Description(
        cpu: json["cpu"] == null ? null : json["cpu"],
        motherboard: json["motherboard"] == null ? null : json["motherboard"],
        memory: json["memory"] == null ? null : json["memory"],
        storage: json["storage"] == null ? null : json["storage"],
        gpu: json["gpu"] == null ? null : json["gpu"],
        descriptionCase: json["case"] == null ? null : json["case"],
        psu: json["psu"] == null ? null : json["psu"],
      );

  Map<String, dynamic> toJson() =>
      {
        "cpu": cpu == null ? null : cpu,
        "motherboard": motherboard == null ? null : motherboard,
        "memory": memory == null ? null : memory,
        "storage": storage == null ? null : storage,
        "gpu": gpu == null ? null : gpu,
        "case": descriptionCase == null ? null : descriptionCase,
        "psu": psu == null ? null : psu,
      };
}

