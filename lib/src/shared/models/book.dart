// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
    List<Publish> publishers;
    String pagination;
    Identifiers identifiers;
    String subtitle;
    String title;
    String url;
    Classifications classifications;
    String notes;
    int numberOfPages;
    Cover cover;
    List<Author> subjects;
    String publishDate;
    String key;
    List<Author> authors;
    String byStatement;
    List<Publish> publishPlaces;
    List<Ebook> ebooks;

    BookModel({
        this.publishers,
        this.pagination,
        this.identifiers,
        this.subtitle,
        this.title,
        this.url,
        this.classifications,
        this.notes,
        this.numberOfPages,
        this.cover,
        this.subjects,
        this.publishDate,
        this.key,
        this.authors,
        this.byStatement,
        this.publishPlaces,
        this.ebooks,
    });

    factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        publishers: List<Publish>.from(json["publishers"].map((x) => Publish.fromJson(x))),
        pagination: json["pagination"],
        identifiers: Identifiers.fromJson(json["identifiers"]),
        subtitle: json["subtitle"],
        title: json["title"],
        url: json["url"],
        classifications: Classifications.fromJson(json["classifications"]),
        notes: json["notes"],
        numberOfPages: json["number_of_pages"],
        cover: Cover.fromJson(json["cover"]),
        subjects: List<Author>.from(json["subjects"].map((x) => Author.fromJson(x))),
        publishDate: json["publish_date"],
        key: json["key"],
        authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
        byStatement: json["by_statement"],
        publishPlaces: List<Publish>.from(json["publish_places"].map((x) => Publish.fromJson(x))),
        ebooks: List<Ebook>.from(json["ebooks"].map((x) => Ebook.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "publishers": List<dynamic>.from(publishers.map((x) => x.toJson())),
        "pagination": pagination,
        "identifiers": identifiers.toJson(),
        "subtitle": subtitle,
        "title": title,
        "url": url,
        "classifications": classifications.toJson(),
        "notes": notes,
        "number_of_pages": numberOfPages,
        "cover": cover.toJson(),
        "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
        "publish_date": publishDate,
        "key": key,
        "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
        "by_statement": byStatement,
        "publish_places": List<dynamic>.from(publishPlaces.map((x) => x.toJson())),
        "ebooks": List<dynamic>.from(ebooks.map((x) => x.toJson())),
    };
}

class Author {
    String url;
    String name;

    Author({
        this.url,
        this.name,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        url: json["url"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "name": name,
    };
}

class Classifications {
    List<String> deweyDecimalClass;
    List<String> lcClassifications;

    Classifications({
        this.deweyDecimalClass,
        this.lcClassifications,
    });

    factory Classifications.fromJson(Map<String, dynamic> json) => Classifications(
        deweyDecimalClass: List<String>.from(json["dewey_decimal_class"].map((x) => x)),
        lcClassifications: List<String>.from(json["lc_classifications"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "dewey_decimal_class": List<dynamic>.from(deweyDecimalClass.map((x) => x)),
        "lc_classifications": List<dynamic>.from(lcClassifications.map((x) => x)),
    };
}

class Cover {
    String small;
    String large;
    String medium;

    Cover({
        this.small,
        this.large,
        this.medium,
    });

    factory Cover.fromJson(Map<String, dynamic> json) => Cover(
        small: json["small"],
        large: json["large"],
        medium: json["medium"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
        "medium": medium,
    };
}

class Ebook {
    Formats formats;
    String previewUrl;
    String availability;

    Ebook({
        this.formats,
        this.previewUrl,
        this.availability,
    });

    factory Ebook.fromJson(Map<String, dynamic> json) => Ebook(
        formats: Formats.fromJson(json["formats"]),
        previewUrl: json["preview_url"],
        availability: json["availability"],
    );

    Map<String, dynamic> toJson() => {
        "formats": formats.toJson(),
        "preview_url": previewUrl,
        "availability": availability,
    };
}

class Formats {
    Formats();

    factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Identifiers {
    List<String> lccn;
    List<String> openlibrary;
    List<String> isbn10;
    List<String> wikidata;
    List<String> goodreads;
    List<String> librarything;

    Identifiers({
        this.lccn,
        this.openlibrary,
        this.isbn10,
        this.wikidata,
        this.goodreads,
        this.librarything,
    });

    factory Identifiers.fromJson(Map<String, dynamic> json) => Identifiers(
        lccn: List<String>.from(json["lccn"].map((x) => x)),
        openlibrary: List<String>.from(json["openlibrary"].map((x) => x)),
        isbn10: List<String>.from(json["isbn_10"].map((x) => x)),
        wikidata: List<String>.from(json["wikidata"].map((x) => x)),
        goodreads: List<String>.from(json["goodreads"].map((x) => x)),
        librarything: List<String>.from(json["librarything"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "lccn": List<dynamic>.from(lccn.map((x) => x)),
        "openlibrary": List<dynamic>.from(openlibrary.map((x) => x)),
        "isbn_10": List<dynamic>.from(isbn10.map((x) => x)),
        "wikidata": List<dynamic>.from(wikidata.map((x) => x)),
        "goodreads": List<dynamic>.from(goodreads.map((x) => x)),
        "librarything": List<dynamic>.from(librarything.map((x) => x)),
    };
}

class Publish {
    String name;

    Publish({
        this.name,
    });

    factory Publish.fromJson(Map<String, dynamic> json) => Publish(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
