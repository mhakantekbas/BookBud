// To parse this JSON data, do
//
//     final bookModel = bookModelFromMap(jsonString);

import 'dart:convert';

class BookModel {
  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;
  final SearchInfo? searchInfo;

  factory BookModel.fromJson(String str) => BookModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookModel.fromMap(Map<String, dynamic> json) => BookModel(
        kind: json["kind"],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromMap(json["volumeInfo"]),
        saleInfo: SaleInfo.fromMap(json["saleInfo"]),
        accessInfo: AccessInfo.fromMap(json["accessInfo"]),
        searchInfo: SearchInfo.fromMap(json["searchInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo?.toMap(),
        "saleInfo": saleInfo?.toMap(),
        "accessInfo": accessInfo?.toMap(),
        "searchInfo": searchInfo?.toMap(),
      };
}

class AccessInfo {
  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  final String? country;
  final String? viewability;
  final bool? embeddable;
  final bool? publicDomain;
  final String? textToSpeechPermission;
  final Epub? epub;
  final Epub? pdf;
  final String? webReaderLink;
  final String? accessViewStatus;
  final bool? quoteSharingAllowed;

  factory AccessInfo.fromJson(String str) =>
      AccessInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccessInfo.fromMap(Map<String, dynamic> json) => AccessInfo(
        country: json["country"],
        viewability: json["viewability"],
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: json["textToSpeechPermission"],
        epub: Epub.fromMap(json["epub"]),
        pdf: Epub.fromMap(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: json["accessViewStatus"],
        quoteSharingAllowed: json["quoteSharingAllowed"],
      );

  Map<String, dynamic> toMap() => {
        "country": country,
        "viewability": viewability,
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission": textToSpeechPermission,
        "epub": epub?.toMap(),
        "pdf": pdf?.toMap(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatus,
        "quoteSharingAllowed": quoteSharingAllowed,
      };
}

class Epub {
  Epub({
    this.isAvailable,
  });

  final bool? isAvailable;

  factory Epub.fromJson(String str) => Epub.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Epub.fromMap(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
      );

  Map<String, dynamic> toMap() => {
        "isAvailable": isAvailable,
      };
}

class SaleInfo {
  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
  });

  final String? country;
  final String? saleability;
  final bool? isEbook;

  factory SaleInfo.fromJson(String str) => SaleInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SaleInfo.fromMap(Map<String, dynamic> json) => SaleInfo(
        country: json["country"],
        saleability: json["saleability"],
        isEbook: json["isEbook"],
      );

  Map<String, dynamic> toMap() => {
        "country": country,
        "saleability": saleability,
        "isEbook": isEbook,
      };
}

class SearchInfo {
  SearchInfo({
    this.textSnippet,
  });

  final String? textSnippet;

  factory SearchInfo.fromJson(String str) =>
      SearchInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchInfo.fromMap(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"],
      );

  Map<String, dynamic> toMap() => {
        "textSnippet": textSnippet,
      };
}

class VolumeInfo {
  VolumeInfo({
    this.title,
    this.authors,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  final String? title;
  final List<String>? authors;
  final String? publishedDate;
  final String? description;
  final List<IndustryIdentifier>? industryIdentifiers;
  final ReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final List<String>? categories;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummary? panelizationSummary;
  final ImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  factory VolumeInfo.fromJson(String str) =>
      VolumeInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VolumeInfo.fromMap(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        authors: List<String>.from(json["authors"].map((x) => x)),
        publishedDate: json["publishedDate"],
        description: json["description"],
        industryIdentifiers: List<IndustryIdentifier>.from(
            json["industryIdentifiers"]
                .map((x) => IndustryIdentifier.fromMap(x))),
        readingModes: ReadingModes.fromMap(json["readingModes"]),
        pageCount: json["pageCount"],
        printType: json["printType"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        maturityRating: json["maturityRating"],
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        panelizationSummary:
            PanelizationSummary.fromMap(json["panelizationSummary"]),
        imageLinks: ImageLinks.fromMap(json["imageLinks"]),
        language: json["language"],
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "authors": List<dynamic>.from(authors!.map((x) => x)),
        "publishedDate": publishedDate,
        "description": description,
        "industryIdentifiers":
            List<dynamic>.from(industryIdentifiers!.map((x) => x.toMap())),
        "readingModes": readingModes!.toMap(),
        "pageCount": pageCount,
        "printType": printType,
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "maturityRating": maturityRating,
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "panelizationSummary": panelizationSummary!.toMap(),
        "imageLinks": imageLinks!.toMap(),
        "language": language,
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
      };
}

class ImageLinks {
  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  final String? smallThumbnail;
  final String? thumbnail;

  factory ImageLinks.fromJson(String str) =>
      ImageLinks.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImageLinks.fromMap(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toMap() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
      };
}

class IndustryIdentifier {
  IndustryIdentifier({
    this.type,
    this.identifier,
  });

  final String? type;
  final String? identifier;

  factory IndustryIdentifier.fromJson(String str) =>
      IndustryIdentifier.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IndustryIdentifier.fromMap(Map<String, dynamic> json) =>
      IndustryIdentifier(
        type: json["type"],
        identifier: json["identifier"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "identifier": identifier,
      };
}

class PanelizationSummary {
  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  factory PanelizationSummary.fromJson(String str) =>
      PanelizationSummary.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PanelizationSummary.fromMap(Map<String, dynamic> json) =>
      PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
      );

  Map<String, dynamic> toMap() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
      };
}

class ReadingModes {
  ReadingModes({
    this.text,
    this.image,
  });

  final bool? text;
  final bool? image;

  factory ReadingModes.fromJson(String str) =>
      ReadingModes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReadingModes.fromMap(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "image": image,
      };
}
