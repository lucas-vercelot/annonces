//
//  ClassifiedAdEnricherTests.swift
//  AnnoncesTests
//
//  Created by Lucas VERCELOT on 20/12/2021.
//

import XCTest
@testable import Annonces
@testable import Annonces_Entities

class ClassifiedAdEnricherTests: XCTestCase {

    func test__given_several_classifiedAds_and_all_adCategories__enricher_should_enrich_items() {
        // Given
        let adCatgories = getAllAdCategories()
        let classifiedAds = getClassifiedAds()
        
        // When
        let enricher = ClassifiedAdEnricher()
        let enrichedClassifiedAds = enricher.enrich(classifiedAds: classifiedAds, withAdCategories: adCatgories)
        
        // Then
        XCTAssertFalse(enrichedClassifiedAds.isEmpty)
        XCTAssertEqual(enrichedClassifiedAds, getValidEnrichedClassifiedAds())
    }
}

// MARK: - AdCategories and ClassifiedAds data

extension ClassifiedAdEnricherTests {
 
    func getAllAdCategories() -> [AdCategory] {
        return [
            AdCategory(id: 1, name: "Véhicule"),
            AdCategory(id: 2, name: "Mode"),
            AdCategory(id: 3, name: "Bricolage"),
            AdCategory(id: 4, name: "Maison"),
            AdCategory(id: 5, name: "Loisirs"),
            AdCategory(id: 6, name: "Immobilier"),
            AdCategory(id: 7, name: "Livres/CD/DVD"),
            AdCategory(id: 8, name: "Multimédia"),
            AdCategory(id: 9, name: "Service"),
            AdCategory(id: 10, name: "Animaux"),
            AdCategory(id: 11, name: "Enfants")
        ]
    }
    
    func getClassifiedAds() -> [ClassifiedAd] {
        return [
            ClassifiedAd(
                id: 1461267313,
                title: "Statue homme noir assis en plâtre polychrome",
                categoryId: 4,
                creationDate: DateFormatter.classifiedAdDateFormatter.date(from: "2019-11-05T15:56:59+0000")!,
                description: "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.",
                isUrgent: false,
                imagesURL: ClassifiedAd.ImagesURL(
                    small: URL(string: "https://awesomeImages/small.jpg")!,
                    thumbnail: URL(string: "https://awesomeImages/thumb.jpg")!
                ),
                price: 140.00
            ),
            ClassifiedAd(
                id: 1077103477,
                title: "Ensemble fille 1 mois NEUF",
                categoryId: 2,
                creationDate: DateFormatter.classifiedAdDateFormatter.date(from: "2019-11-05T15:56:52+0000")!,
                description: "Vends Robe avec t-shirt neuf Presti Presto en 1 mois.",
                isUrgent: true,
                imagesURL: ClassifiedAd.ImagesURL(
                    small: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/5ae4741dabd3a236cbfb8b6a5746acba6823e41e.jpg")!,
                    thumbnail: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/5ae4741dabd3a236cbfb8b6a5746acba6823e41e.jpg")!
                ),
                price: 5.00
            ),
            ClassifiedAd(
                id: 1671026575,
                title: "Sony Ericsson Xperia Arc S + coque (occasion)",
                categoryId: 8,
                creationDate: DateFormatter.classifiedAdDateFormatter.date(from: "2019-11-05T15:56:50+0000")!,
                description: "Je vends ce Sony Ericsson Xperia Arc S, TOUT fonctionne PARFAITEMENT.  Le téléphone présente quelques traces d'usures (rayures). Un téléphone comme celui-ci vaut actuellement 80 Euro(s) sur internet, je vous le vends donc pour 50 Euro(s) avec la coque en cadeau !  Modèle : LT18i",
                isUrgent: true,
                imagesURL: ClassifiedAd.ImagesURL(
                    small: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/e0a5bddfc205b940d8679680c3a0e08a6c1cb919.jpg")!,
                    thumbnail: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/e0a5bddfc205b940d8679680c3a0e08a6c1cb919.jpg")!
                ),
                price: 50.00
            ),
            ClassifiedAd(
                id: 1701863965,
                title: "LEGO TRAIN PASSAGERS Pièce Détachée",
                categoryId: 5,
                creationDate: DateFormatter.classifiedAdDateFormatter.date(from: "2019-11-05T15:56:45+0000")!,
                description: "LEGO Le train de passagers rouge Lego 7938 vrac de pièces détachées pour agrandir votre train avec les rails ou le compléter avec des pièces toutes les pièces sont présentes sur la photo je ne fais pas d'envoi Remise Paris ( je peux me deplacer sur 16, 15 ou 14 ieme)",
                isUrgent: false,
                imagesURL: ClassifiedAd.ImagesURL(
                    small: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/40d3d4c3ee75786859e638146a0a3e3a405e757d.jpg")!,
                    thumbnail: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/40d3d4c3ee75786859e638146a0a3e3a405e757d.jpg")!
                ),
                price: 37.00
            ),
            ClassifiedAd(
                id: 1685116102,
                title: "Boutique à céder Oberkampf",
                categoryId: 6,
                creationDate: DateFormatter.classifiedAdDateFormatter.date(from: "2019-10-04T15:26:36+0000")!,
                description: "Cause démenagement en province, local commercial à céder situé dans la dynamique rue Saint-Maur. Actuellement boutique de prêt-à-porter avec une très belle clientèle. Idéal prêt-à-porter, créateur bijoux, Dépôt-vente etc... Pas de restauration avec extraction. Agences s'abstenir !",
                isUrgent: false,
                imagesURL: ClassifiedAd.ImagesURL(
                    small: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/c4ec3e7f665977a9922e934c25643a49db9a6f83.jpg")!,
                    thumbnail: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/c4ec3e7f665977a9922e934c25643a49db9a6f83.jpg")!
                ),
                price: 45000.00
            ),
            ClassifiedAd(
                id: 1701846531,
                title: "Objectif Sony Fe 35mm F/2.8",
                categoryId: 8,
                creationDate: DateFormatter.classifiedAdDateFormatter.date(from: "2019-11-05T15:56:43+0000")!,
                description: "Bonjour Je vend cet objectif Sony FE Zeiss 35mm ouverture F 2.8 acheté il y a 6 mois dans un état pratiquement neuf et dans son emballage d'origine. Pour plus d'information envoyez moi un message",
                isUrgent: true,
                imagesURL: ClassifiedAd.ImagesURL(
                    small: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/254308d0083d9293657d938f782c079bfa4a0b3a.jpg")!,
                    thumbnail: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/254308d0083d9293657d938f782c079bfa4a0b3a.jpg")!
                ),
                price: 470.00
            )
        ]
    }
    
    func getValidEnrichedClassifiedAds() -> [EnrichedClassifiedAd] {
        return [
            EnrichedClassifiedAd(
                from:
                    ClassifiedAd(
                        id: 1461267313,
                        title: "Statue homme noir assis en plâtre polychrome",
                        categoryId: 4,
                        creationDate: DateFormatter.classifiedAdDateFormatter.date(from: "2019-11-05T15:56:59+0000")!,
                        description: "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.",
                        isUrgent: false,
                        imagesURL: ClassifiedAd.ImagesURL(
                            small: URL(string: "https://awesomeImages/small.jpg")!,
                            thumbnail: URL(string: "https://awesomeImages/thumb.jpg")!
                        ),
                        price: 140.00
                    ),
                andCategory:
                    AdCategory(id: 4, name: "Maison")
            ),
            EnrichedClassifiedAd(
                from:
                    ClassifiedAd(
                        id: 1077103477,
                        title: "Ensemble fille 1 mois NEUF",
                        categoryId: 2,
                        creationDate: DateFormatter.classifiedAdDateFormatter.date(from: "2019-11-05T15:56:52+0000")!,
                        description: "Vends Robe avec t-shirt neuf Presti Presto en 1 mois.",
                        isUrgent: true,
                        imagesURL: ClassifiedAd.ImagesURL(
                            small: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/5ae4741dabd3a236cbfb8b6a5746acba6823e41e.jpg")!,
                            thumbnail: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/5ae4741dabd3a236cbfb8b6a5746acba6823e41e.jpg")!
                        ),
                        price: 5.00
                    ),
                andCategory:
                    AdCategory(id: 2, name: "Mode")
            ),
            EnrichedClassifiedAd(
                from:
                    ClassifiedAd(
                        id: 1671026575,
                        title: "Sony Ericsson Xperia Arc S + coque (occasion)",
                        categoryId: 8,
                        creationDate: DateFormatter.classifiedAdDateFormatter.date(from: "2019-11-05T15:56:50+0000")!,
                        description: "Je vends ce Sony Ericsson Xperia Arc S, TOUT fonctionne PARFAITEMENT.  Le téléphone présente quelques traces d'usures (rayures). Un téléphone comme celui-ci vaut actuellement 80 Euro(s) sur internet, je vous le vends donc pour 50 Euro(s) avec la coque en cadeau !  Modèle : LT18i",
                        isUrgent: true,
                        imagesURL: ClassifiedAd.ImagesURL(
                            small: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/e0a5bddfc205b940d8679680c3a0e08a6c1cb919.jpg")!,
                            thumbnail: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/e0a5bddfc205b940d8679680c3a0e08a6c1cb919.jpg")!
                        ),
                        price: 50.00
                    ),
                andCategory:
                    AdCategory(id: 8, name: "Multimédia")
            ),
            EnrichedClassifiedAd(
                from:
                    ClassifiedAd(
                        id: 1701863965,
                        title: "LEGO TRAIN PASSAGERS Pièce Détachée",
                        categoryId: 5,
                        creationDate: DateFormatter.classifiedAdDateFormatter.date(from: "2019-11-05T15:56:45+0000")!,
                        description: "LEGO Le train de passagers rouge Lego 7938 vrac de pièces détachées pour agrandir votre train avec les rails ou le compléter avec des pièces toutes les pièces sont présentes sur la photo je ne fais pas d'envoi Remise Paris ( je peux me deplacer sur 16, 15 ou 14 ieme)",
                        isUrgent: false,
                        imagesURL: ClassifiedAd.ImagesURL(
                            small: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/40d3d4c3ee75786859e638146a0a3e3a405e757d.jpg")!,
                            thumbnail: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/40d3d4c3ee75786859e638146a0a3e3a405e757d.jpg")!
                        ),
                        price: 37.00
                    ),
                andCategory:
                    AdCategory(id: 5, name: "Loisirs")
            ),
            EnrichedClassifiedAd(
                from:
                    ClassifiedAd(
                        id: 1685116102,
                        title: "Boutique à céder Oberkampf",
                        categoryId: 6,
                        creationDate: DateFormatter.classifiedAdDateFormatter.date(from: "2019-10-04T15:26:36+0000")!,
                        description: "Cause démenagement en province, local commercial à céder situé dans la dynamique rue Saint-Maur. Actuellement boutique de prêt-à-porter avec une très belle clientèle. Idéal prêt-à-porter, créateur bijoux, Dépôt-vente etc... Pas de restauration avec extraction. Agences s'abstenir !",
                        isUrgent: false,
                        imagesURL: ClassifiedAd.ImagesURL(
                            small: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/c4ec3e7f665977a9922e934c25643a49db9a6f83.jpg")!,
                            thumbnail: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/c4ec3e7f665977a9922e934c25643a49db9a6f83.jpg")!
                        ),
                        price: 45000.00
                    ),
                andCategory:
                    AdCategory(id: 6, name: "Immobilier")
            ),
            EnrichedClassifiedAd(
                from:
                    ClassifiedAd(
                        id: 1701846531,
                        title: "Objectif Sony Fe 35mm F/2.8",
                        categoryId: 8,
                        creationDate: DateFormatter.classifiedAdDateFormatter.date(from: "2019-11-05T15:56:43+0000")!,
                        description: "Bonjour Je vend cet objectif Sony FE Zeiss 35mm ouverture F 2.8 acheté il y a 6 mois dans un état pratiquement neuf et dans son emballage d'origine. Pour plus d'information envoyez moi un message",
                        isUrgent: true,
                        imagesURL: ClassifiedAd.ImagesURL(
                            small: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/254308d0083d9293657d938f782c079bfa4a0b3a.jpg")!,
                            thumbnail: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/254308d0083d9293657d938f782c079bfa4a0b3a.jpg")!
                        ),
                        price: 470.00
                    ),
                andCategory:
                    AdCategory(id: 8, name: "Multimédia")
            )
        ]
    }
}
