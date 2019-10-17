// To parse this JSON data, do
//
//     final bookViewModel = bookViewModelFromJson(jsonString);

import 'dart:convert';

BookViewModel bookViewModelFromJson(String str) => BookViewModel.fromJson(json.decode(str));

String bookViewModelToJson(BookViewModel data) => json.encode(data.toJson());

class BookViewModel {
    Created description;
    List<Link> links;
    Created created;
    String title;
    List<int> covers;
    List<String> subjectPlaces;
    Created lastModified;
    List<String> subjectPeople;
    String key;
    List<Author> authors;
    int latestRevision;
    Type type;
    List<String> subjects;
    int revision;

    BookViewModel({
        this.description,
        this.links,
        this.created,
        this.title,
        this.covers,
        this.subjectPlaces,
        this.lastModified,
        this.subjectPeople,
        this.key,
        this.authors,
        this.latestRevision,
        this.type,
        this.subjects,
        this.revision,
    });

    factory BookViewModel.fromJson(Map<String, dynamic> json) => BookViewModel(
        description: json["description"] == null ? null : Created.fromJson(json["description"]),
        links: json["links"] == null ? null : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        created: json["created"] == null ? null : Created.fromJson(json["created"]),
        title: json["title"] == null ? null : json["title"],
        covers: json["covers"] == null ? null : List<int>.from(json["covers"].map((x) => x)),
        subjectPlaces: json["subject_places"] == null ? null : List<String>.from(json["subject_places"].map((x) => x)),
        lastModified: json["last_modified"] == null ? null : Created.fromJson(json["last_modified"]),
        subjectPeople: json["subject_people"] == null ? null : List<String>.from(json["subject_people"].map((x) => x)),
        key: json["key"] == null ? null : json["key"],
        authors: json["authors"] == null ? null : List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
        latestRevision: json["latest_revision"] == null ? null : json["latest_revision"],
        type: json["type"] == null ? null : Type.fromJson(json["type"]),
        subjects: json["subjects"] == null ? null : List<String>.from(json["subjects"].map((x) => x)),
        revision: json["revision"] == null ? null : json["revision"],
    );

    Map<String, dynamic> toJson() => {
        "description": description == null ? null : description.toJson(),
        "links": links == null ? null : List<dynamic>.from(links.map((x) => x.toJson())),
        "created": created == null ? null : created.toJson(),
        "title": title == null ? null : title,
        "covers": covers == null ? null : List<dynamic>.from(covers.map((x) => x)),
        "subject_places": subjectPlaces == null ? null : List<dynamic>.from(subjectPlaces.map((x) => x)),
        "last_modified": lastModified == null ? null : lastModified.toJson(),
        "subject_people": subjectPeople == null ? null : List<dynamic>.from(subjectPeople.map((x) => x)),
        "key": key == null ? null : key,
        "authors": authors == null ? null : List<dynamic>.from(authors.map((x) => x.toJson())),
        "latest_revision": latestRevision == null ? null : latestRevision,
        "type": type == null ? null : type.toJson(),
        "subjects": subjects == null ? null : List<dynamic>.from(subjects.map((x) => x)),
        "revision": revision == null ? null : revision,
    };
}

class Author {
    Type type;
    Type author;

    Author({
        this.type,
        this.author,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        type: json["type"] == null ? null : Type.fromJson(json["type"]),
        author: json["author"] == null ? null : Type.fromJson(json["author"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type.toJson(),
        "author": author == null ? null : author.toJson(),
    };
}

class Type {
    String key;

    Type({
        this.key,
    });

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        key: json["key"] == null ? null : json["key"],
    );

    Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
    };
}

class Created {
    String type;
    String value;

    Created({
        this.type,
        this.value,
    });

    factory Created.fromJson(Map<String, dynamic> json) => Created(
        type: json["type"] == null ? null : json["type"],
        value: json["value"] == null ? null : json["value"],
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "value": value == null ? null : value,
    };
}

class Link {
    String url;
    Type type;
    String title;

    Link({
        this.url,
        this.type,
        this.title,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        type: json["type"] == null ? null : Type.fromJson(json["type"]),
        title: json["title"] == null ? null : json["title"],
    );

    Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "type": type == null ? null : type.toJson(),
        "title": title == null ? null : title,
    };
}
