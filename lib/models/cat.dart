
import 'package:json_annotation/json_annotation.dart';

part 'cat.g.dart';

@JsonSerializable()
class Cat {
  Cat({this.weight,
        this.id,
        this.name,
        this.cfaUrl,
        this.vetstreetUrl,
        this.vcahospitalsUrl,
        this.temperament,
        this.origin,
        this.countryCodes,
        this.countryCode,
        this.description,
        this.lifeSpan,
        this.indoor,
        this.lap,
        this.altNames,
        this.adaptability,
        this.affectionLevel,
        this.childFriendly,
        this.dogFriendly,
        this.energyLevel,
        this.grooming,
        this.healthIssues,
        this.intelligence,
        this.sheddingLevel,
        this.socialNeeds,
        this.strangerFriendly,
        this.vocalisation,
        this.experimental,
        this.hairless,
        this.natural,
        this.rare,
        this.rex,
        this.suppressedTail,
        this.shortLegs,
        this.wikipediaUrl,
        this.hypoallergenic,
        this.referenceImageId,
        this.image,
        this.catFriendly,
        this.bidability,
    });

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        weight: json["weight"] == null ? null : Weight.fromJson(json["weight"]),
        id: json["id"],
        name: json["name"],
        cfaUrl: json["cfa_url"],
        vetstreetUrl: json["vetstreet_url"],
        vcahospitalsUrl: json["vcahospitals_url"],
        temperament: json["temperament"],
        origin: json["origin"],
        countryCodes: json["country_codes"],
        countryCode: json["country_code"],
        description: json["description"],
        lifeSpan: json["life_span"],
        indoor: json["indoor"],
        lap: json["lap"],
        altNames: json["alt_names"],
        adaptability: json["adaptability"],
        affectionLevel: json["affection_level"],
        childFriendly: json["child_friendly"],
        dogFriendly: json["dog_friendly"],
        energyLevel: json["energy_level"],
        grooming: json["grooming"],
        healthIssues: json["health_issues"],
        intelligence: json["intelligence"],
        sheddingLevel: json["shedding_level"],
        socialNeeds: json["social_needs"],
        strangerFriendly: json["stranger_friendly"],
        vocalisation: json["vocalisation"],
        experimental: json["experimental"],
        hairless: json["hairless"],
        natural: json["natural"],
        rare: json["rare"],
        rex: json["rex"],
        suppressedTail: json["suppressed_tail"],
        shortLegs: json["short_legs"],
        wikipediaUrl: json["wikipedia_url"],
        hypoallergenic: json["hypoallergenic"],
        referenceImageId: json["reference_image_id"],
        image: json["image"] == null ? null : Images.fromJson(json["image"]),
        catFriendly: json["cat_friendly"],
        bidability: json["bidability"],
      );

    Weight? weight;
    String? id;
    String? name;
    String? cfaUrl;
    String? vetstreetUrl;
    String? vcahospitalsUrl;
    String? temperament;
    String? origin;
    String? countryCodes;
    String? countryCode;
    String? description;
    String? lifeSpan;
    int? indoor;
    int? lap;
    String? altNames;
    int? adaptability;
    int? affectionLevel;
    int? childFriendly;
    int? dogFriendly;
    int? energyLevel;
    int? grooming;
    int? healthIssues;
    int? intelligence;
    int? sheddingLevel;
    int? socialNeeds;
    int? strangerFriendly;
    int? vocalisation;
    int? experimental;
    int? hairless;
    int? natural;
    int? rare;
    int? rex;
    int? suppressedTail;
    int? shortLegs;
    String? wikipediaUrl;
    int? hypoallergenic;
    String? referenceImageId;
    Images? image;
    int? catFriendly;
    int? bidability;

  Map<String, dynamic> toJson() => _$CatToJson(this);

  @override
  String toString() => toJson().toString();
}


@JsonSerializable()
class Images {
    String? id;
    int? width;
    int? height;
    String? url;

    Images();


    factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

    Map<String, dynamic> toJson() => _$ImagesToJson(this);

    @override
    String toString() => toJson().toString();
}


@JsonSerializable()
class Weight {

  Weight();

  String? imperial;
  String? metric;

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);

  Map<String, dynamic> toJson() => _$WeightToJson(this);

  @override
  String toString() => toJson().toString();
}
