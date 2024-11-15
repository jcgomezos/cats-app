
import 'package:json_annotation/json_annotation.dart';

part 'cat_response.g.dart';

@JsonSerializable()
class CatResponse {
    
    CatResponse({
        this.breeds,
        this.id,
        this.url,
        this.width,
        this.height,
    });

    List<Breed>? breeds;
    String? id;
    String? url;
    int? width;
    int? height;

    factory CatResponse.fromJson(Map<String, dynamic> json) => CatResponse(
        breeds: json["breeds"] == null ? [] : List<Breed>.from(json["breeds"]!.map((x) => Breed.fromJson(x))),
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => _$CatResponseToJson(this);

    @override
     String toString() => toJson().toString();
}

@JsonSerializable()
class Breed {
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
    int? adaptability;
    int? affectionLevel;
    int? childFriendly;
    int? catFriendly;
    int? dogFriendly;
    int? energyLevel;
    int? grooming;
    int? healthIssues;
    int? intelligence;
    int? sheddingLevel;
    int? socialNeeds;
    int? strangerFriendly;
    int? vocalisation;
    int? bidability;
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

    Breed({
        this.weight,
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
        this.adaptability,
        this.affectionLevel,
        this.childFriendly,
        this.catFriendly,
        this.dogFriendly,
        this.energyLevel,
        this.grooming,
        this.healthIssues,
        this.intelligence,
        this.sheddingLevel,
        this.socialNeeds,
        this.strangerFriendly,
        this.vocalisation,
        this.bidability,
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
    });


    factory Breed.fromJson(Map<String, dynamic> json) => Breed(
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
        adaptability: json["adaptability"],
        affectionLevel: json["affection_level"],
        childFriendly: json["child_friendly"],
        catFriendly: json["cat_friendly"],
        dogFriendly: json["dog_friendly"],
        energyLevel: json["energy_level"],
        grooming: json["grooming"],
        healthIssues: json["health_issues"],
        intelligence: json["intelligence"],
        sheddingLevel: json["shedding_level"],
        socialNeeds: json["social_needs"],
        strangerFriendly: json["stranger_friendly"],
        vocalisation: json["vocalisation"],
        bidability: json["bidability"],
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
    );

    Map<String, dynamic> toJson() => _$BreedToJson(this);

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



