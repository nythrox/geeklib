// To parse this JSON data, do
//
//     final queryResponseModel = queryResponseModelFromJson(jsonString);

import 'dart:convert';

QueryResponseModel queryResponseModelFromJson(String str) => QueryResponseModel.fromJson(json.decode(str));

String queryResponseModelToJson(QueryResponseModel data) => json.encode(data.toJson());

class QueryResponseModel {
    int start;
    int queryResponseModelNumFound;
    int numFound;
    List<Doc> docs;

    QueryResponseModel({
        this.start,
        this.queryResponseModelNumFound,
        this.numFound,
        this.docs,
    });

    factory QueryResponseModel.fromJson(Map<String, dynamic> json) => QueryResponseModel(
        start: json["start"],
        queryResponseModelNumFound: json["num_found"],
        numFound: json["numFound"],
        docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "start": start,
        "num_found": queryResponseModelNumFound,
        "numFound": numFound,
        "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
    };
}

class Doc {
    String titleSuggest;
    List<String> editionKey;
    int coverI;
    List<String> isbn;
    bool hasFulltext;
    List<String> idDepsitoLegal;
    List<String> text;
    List<String> authorName;
    List<String> contributor;
    List<String> iaLoadedId;
    List<String> seed;
    List<String> oclc;
    List<String> idGoogle;
    List<String> ia;
    List<String> authorKey;
    List<String> subject;
    String title;
    String lendingIdentifierS;
    String iaCollectionS;
    int firstPublishYear;
    Type type;
    int ebookCountI;
    List<String> publishPlace;
    List<String> iaBoxId;
    int editionCount;
    String key;
    List<String> idAlibrisId;
    List<String> idGoodreads;
    List<String> authorAlternativeName;
    bool publicScanB;
    List<String> idOverdrive;
    List<String> publisher;
    List<String> idAmazon;
    List<String> idPaperbackSwap;
    List<String> idCanadianNationalLibraryArchive;
    List<String> language;
    List<String> lccn;
    int lastModifiedI;
    String lendingEditionS;
    List<String> idLibrarything;
    String coverEditionKey;
    List<String> person;
    List<int> publishYear;
    String printdisabledS;
    List<String> place;
    List<String> time;
    List<String> publishDate;
    List<String> idWikidata;
    List<String> firstSentence;
    String subtitle;

    Doc({
        this.titleSuggest,
        this.editionKey,
        this.coverI,
        this.isbn,
        this.hasFulltext,
        this.idDepsitoLegal,
        this.text,
        this.authorName,
        this.contributor,
        this.iaLoadedId,
        this.seed,
        this.oclc,
        this.idGoogle,
        this.ia,
        this.authorKey,
        this.subject,
        this.title,
        this.lendingIdentifierS,
        this.iaCollectionS,
        this.firstPublishYear,
        this.type,
        this.ebookCountI,
        this.publishPlace,
        this.iaBoxId,
        this.editionCount,
        this.key,
        this.idAlibrisId,
        this.idGoodreads,
        this.authorAlternativeName,
        this.publicScanB,
        this.idOverdrive,
        this.publisher,
        this.idAmazon,
        this.idPaperbackSwap,
        this.idCanadianNationalLibraryArchive,
        this.language,
        this.lccn,
        this.lastModifiedI,
        this.lendingEditionS,
        this.idLibrarything,
        this.coverEditionKey,
        this.person,
        this.publishYear,
        this.printdisabledS,
        this.place,
        this.time,
        this.publishDate,
        this.idWikidata,
        this.firstSentence,
        this.subtitle,
    });

    factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        titleSuggest: json["title_suggest"],
        editionKey: json["edition_key"] == null ? null : List<String>.from(json["edition_key"].map((x) => x)),
        coverI: json["cover_i"] == null ? null : json["cover_i"],
        isbn: json["isbn"] == null ? null : List<String>.from(json["isbn"].map((x) => x)),
        hasFulltext: json["has_fulltext"],
        idDepsitoLegal: json["id_depósito_legal"] == null ? null : List<String>.from(json["id_depósito_legal"].map((x) => x)),
        text: List<String>.from(json["text"].map((x) => x)),
        authorName: json["author_name"] == null ? null : List<String>.from(json["author_name"].map((x) => x)),
        contributor: json["contributor"] == null ? null : List<String>.from(json["contributor"].map((x) => x)),
        iaLoadedId: json["ia_loaded_id"] == null ? null : List<String>.from(json["ia_loaded_id"].map((x) => x)),
        seed: List<String>.from(json["seed"].map((x) => x)),
        oclc: json["oclc"] == null ? null : List<String>.from(json["oclc"].map((x) => x)),
        idGoogle: json["id_google"] == null ? null : List<String>.from(json["id_google"].map((x) => x)),
        ia: json["ia"] == null ? null : List<String>.from(json["ia"].map((x) => x)),
        authorKey: json["author_key"] == null ? null : List<String>.from(json["author_key"].map((x) => x)),
        subject: json["subject"] == null ? null : List<String>.from(json["subject"].map((x) => x)),
        title: json["title"],
        lendingIdentifierS: json["lending_identifier_s"] == null ? null : json["lending_identifier_s"],
        iaCollectionS: json["ia_collection_s"] == null ? null : json["ia_collection_s"],
        firstPublishYear: json["first_publish_year"] == null ? null : json["first_publish_year"],
        type: typeValues.map[json["type"]],
        ebookCountI: json["ebook_count_i"],
        publishPlace: json["publish_place"] == null ? null : List<String>.from(json["publish_place"].map((x) => x)),
        iaBoxId: json["ia_box_id"] == null ? null : List<String>.from(json["ia_box_id"].map((x) => x)),
        editionCount: json["edition_count"],
        key: json["key"],
        idAlibrisId: json["id_alibris_id"] == null ? null : List<String>.from(json["id_alibris_id"].map((x) => x)),
        idGoodreads: json["id_goodreads"] == null ? null : List<String>.from(json["id_goodreads"].map((x) => x)),
        authorAlternativeName: json["author_alternative_name"] == null ? null : List<String>.from(json["author_alternative_name"].map((x) => x)),
        publicScanB: json["public_scan_b"] == null ? null : json["public_scan_b"],
        idOverdrive: json["id_overdrive"] == null ? null : List<String>.from(json["id_overdrive"].map((x) => x)),
        publisher: json["publisher"] == null ? null : List<String>.from(json["publisher"].map((x) => x)),
        idAmazon: json["id_amazon"] == null ? null : List<String>.from(json["id_amazon"].map((x) => x)),
        idPaperbackSwap: json["id_paperback_swap"] == null ? null : List<String>.from(json["id_paperback_swap"].map((x) => x)),
        idCanadianNationalLibraryArchive: json["id_canadian_national_library_archive"] == null ? null : List<String>.from(json["id_canadian_national_library_archive"].map((x) => x)),
        language: json["language"] == null ? null : List<String>.from(json["language"].map((x) => x)),
        lccn: json["lccn"] == null ? null : List<String>.from(json["lccn"].map((x) => x)),
        lastModifiedI: json["last_modified_i"],
        lendingEditionS: json["lending_edition_s"] == null ? null : json["lending_edition_s"],
        idLibrarything: json["id_librarything"] == null ? null : List<String>.from(json["id_librarything"].map((x) => x)),
        coverEditionKey: json["cover_edition_key"] == null ? null : json["cover_edition_key"],
        person: json["person"] == null ? null : List<String>.from(json["person"].map((x) => x)),
        publishYear: json["publish_year"] == null ? null : List<int>.from(json["publish_year"].map((x) => x)),
        printdisabledS: json["printdisabled_s"] == null ? null : json["printdisabled_s"],
        place: json["place"] == null ? null : List<String>.from(json["place"].map((x) => x)),
        time: json["time"] == null ? null : List<String>.from(json["time"].map((x) => x)),
        publishDate: json["publish_date"] == null ? null : List<String>.from(json["publish_date"].map((x) => x)),
        idWikidata: json["id_wikidata"] == null ? null : List<String>.from(json["id_wikidata"].map((x) => x)),
        firstSentence: json["first_sentence"] == null ? null : List<String>.from(json["first_sentence"].map((x) => x)),
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
    );

    Map<String, dynamic> toJson() => {
        "title_suggest": titleSuggest,
        "edition_key": editionKey == null ? null : List<dynamic>.from(editionKey.map((x) => x)),
        "cover_i": coverI == null ? null : coverI,
        "isbn": isbn == null ? null : List<dynamic>.from(isbn.map((x) => x)),
        "has_fulltext": hasFulltext,
        "id_depósito_legal": idDepsitoLegal == null ? null : List<dynamic>.from(idDepsitoLegal.map((x) => x)),
        "text": List<dynamic>.from(text.map((x) => x)),
        "author_name": authorName == null ? null : List<dynamic>.from(authorName.map((x) => x)),
        "contributor": contributor == null ? null : List<dynamic>.from(contributor.map((x) => x)),
        "ia_loaded_id": iaLoadedId == null ? null : List<dynamic>.from(iaLoadedId.map((x) => x)),
        "seed": List<dynamic>.from(seed.map((x) => x)),
        "oclc": oclc == null ? null : List<dynamic>.from(oclc.map((x) => x)),
        "id_google": idGoogle == null ? null : List<dynamic>.from(idGoogle.map((x) => x)),
        "ia": ia == null ? null : List<dynamic>.from(ia.map((x) => x)),
        "author_key": authorKey == null ? null : List<dynamic>.from(authorKey.map((x) => x)),
        "subject": subject == null ? null : List<dynamic>.from(subject.map((x) => x)),
        "title": title,
        "lending_identifier_s": lendingIdentifierS == null ? null : lendingIdentifierS,
        "ia_collection_s": iaCollectionS == null ? null : iaCollectionS,
        "first_publish_year": firstPublishYear == null ? null : firstPublishYear,
        "type": typeValues.reverse[type],
        "ebook_count_i": ebookCountI,
        "publish_place": publishPlace == null ? null : List<dynamic>.from(publishPlace.map((x) => x)),
        "ia_box_id": iaBoxId == null ? null : List<dynamic>.from(iaBoxId.map((x) => x)),
        "edition_count": editionCount,
        "key": key,
        "id_alibris_id": idAlibrisId == null ? null : List<dynamic>.from(idAlibrisId.map((x) => x)),
        "id_goodreads": idGoodreads == null ? null : List<dynamic>.from(idGoodreads.map((x) => x)),
        "author_alternative_name": authorAlternativeName == null ? null : List<dynamic>.from(authorAlternativeName.map((x) => x)),
        "public_scan_b": publicScanB == null ? null : publicScanB,
        "id_overdrive": idOverdrive == null ? null : List<dynamic>.from(idOverdrive.map((x) => x)),
        "publisher": publisher == null ? null : List<dynamic>.from(publisher.map((x) => x)),
        "id_amazon": idAmazon == null ? null : List<dynamic>.from(idAmazon.map((x) => x)),
        "id_paperback_swap": idPaperbackSwap == null ? null : List<dynamic>.from(idPaperbackSwap.map((x) => x)),
        "id_canadian_national_library_archive": idCanadianNationalLibraryArchive == null ? null : List<dynamic>.from(idCanadianNationalLibraryArchive.map((x) => x)),
        "language": language == null ? null : List<dynamic>.from(language.map((x) => x)),
        "lccn": lccn == null ? null : List<dynamic>.from(lccn.map((x) => x)),
        "last_modified_i": lastModifiedI,
        "lending_edition_s": lendingEditionS == null ? null : lendingEditionS,
        "id_librarything": idLibrarything == null ? null : List<dynamic>.from(idLibrarything.map((x) => x)),
        "cover_edition_key": coverEditionKey == null ? null : coverEditionKey,
        "person": person == null ? null : List<dynamic>.from(person.map((x) => x)),
        "publish_year": publishYear == null ? null : List<dynamic>.from(publishYear.map((x) => x)),
        "printdisabled_s": printdisabledS == null ? null : printdisabledS,
        "place": place == null ? null : List<dynamic>.from(place.map((x) => x)),
        "time": time == null ? null : List<dynamic>.from(time.map((x) => x)),
        "publish_date": publishDate == null ? null : List<dynamic>.from(publishDate.map((x) => x)),
        "id_wikidata": idWikidata == null ? null : List<dynamic>.from(idWikidata.map((x) => x)),
        "first_sentence": firstSentence == null ? null : List<dynamic>.from(firstSentence.map((x) => x)),
        "subtitle": subtitle == null ? null : subtitle,
    };
}

enum Type { WORK }

final typeValues = EnumValues({
    "work": Type.WORK
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
