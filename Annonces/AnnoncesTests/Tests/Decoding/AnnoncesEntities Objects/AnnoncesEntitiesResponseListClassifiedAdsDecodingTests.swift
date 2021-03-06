//
//  AnnoncesEntitiesResponseListClassifiedAdsDecodingTests.swift
//  AnnoncesTests
//
//  Created by Lucas VERCELOT on 17/12/2021.
//

import XCTest
@testable import Annonces_Entities

class AnnoncesEntitiesResponseListClassifiedAdsDecodingTests: XCTestCase, DecodingTestable {
    
    var data: Data!

    // MARK: - Given a valid list of four ClassifiedAds

    func test__givenJSONWithAValidListOfFourClassifiedAds__decoding_should_succeed() {
        // Given
        givenJSONWithAValidListOfFourClassifiedAds()
        
        // When
        let decoder = JSONDecoder()
        let classifiedAds = try? decoder.decode(ResponseList<ClassifiedAd>.self, from: data)
        
        // Then
        XCTAssertNotNil(classifiedAds)
        XCTAssertEqual(classifiedAds?.elements.count, 4)
    }
    
    // MARK: - Given a list of four valid and two invalid ClassifiedAds

    func test__givenJSONWithAListOfFourValidAndTwoInvalidClassifiedAds__list_count_should_equal_4() {
        // Given
        givenJSONWithAListOfFourValidAndTwoInvalidClassifiedAds()
        
        // When
        let decoder = JSONDecoder()
        let classifiedAds = try? decoder.decode(ResponseList<ClassifiedAd>.self, from: data)
        
        // Then
        XCTAssertNotNil(classifiedAds)
        XCTAssertEqual(classifiedAds?.elements.count, 4)
    }
    
    // MARK: - Given an empty list of ClassifiedAds
    
    func test__givenJSONWithAnEmptyListOfClassifiedAds__list_should_not_be_nil() {
        // Given
        givenJSONWithAnEmptyListOfClassifiedAds()
        
        // When
        let decoder = JSONDecoder()
        let classifiedAds = try? decoder.decode(ResponseList<ClassifiedAd>.self, from: data)
        
        // Then
        XCTAssertNotNil(classifiedAds)
        XCTAssertEqual(classifiedAds?.elements.count, 0)
    }
}

// MARK: - AnnoncesEntitiesResponseListClassifiedAdsDecodingTests JSON Mocks

extension AnnoncesEntitiesResponseListClassifiedAdsDecodingTests {
    
    // MARK: - MOCK Given a valid list of four ClassifiedAds
    
    private func givenJSONWithAValidListOfFourClassifiedAds() {
        let json =
        """
        [
            {
                "id": 1664493117,
                "category_id": 9,
                "title": "Professeur natif d'espagnol ?? domicile",
                "description": "Doctorant espagnol, ayant fait des ??tudes de linguistique compar??e fran??ais - espagnol et de traduction (th??me/version) 0 la Sorbonne, je vous propose des cours d'espagnol ?? domicile ?? Paris intramuros. Actuellement j'enseigne l'espagnol dans un lyc??e et j'ai plus de cinq ans d'exp??rience comme professeur particulier, ?? Paris et ?? Madrid. Tous les niveaux, tous les ??ges. Je m'adapte ?? vos besoins et vous propose une m??thode personnalis??e et dynamique, selon vos point forts et vos points faibles, pour mieux travailler votre :  - Expression orale - Compr??hension orale - Grammaire - Vocabulaire - Production ??crite - Compr??hension ??crite Tarif : 25 euros/heure",
                "price": 25.00,
                "images_url": {
                    "small": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/af9c43ff5a3b3692f9f1aa3c17d7b46d8b740311.jpg",
                    "thumb": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/af9c43ff5a3b3692f9f1aa3c17d7b46d8b740311.jpg"
                },
                "creation_date": "2019-11-05T15:56:55+0000",
                "is_urgent": false,
                "siret": "123 323 002"
            },
            {
                "id": 1077103477,
                "category_id": 2,
                "title": "Ensemble fille 1 mois NEUF",
                "description": "Vends Robe avec t-shirt neuf Presti Presto en 1 mois.",
                "price": 5.00,
                "images_url": {
                    "small": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/5ae4741dabd3a236cbfb8b6a5746acba6823e41e.jpg",
                    "thumb": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/5ae4741dabd3a236cbfb8b6a5746acba6823e41e.jpg"
                },
                "creation_date": "2019-11-05T15:56:52+0000",
                "is_urgent": true
            },
            {
                "id": 1671026575,
                "category_id": 8,
                "title": "Sony Ericsson Xperia Arc S + coque (occasion)",
                "description": "Je vends ce Sony Ericsson Xperia Arc S, TOUT fonctionne PARFAITEMENT.  Le t??l??phone pr??sente quelques traces d'usures (rayures). Un t??l??phone comme celui-ci vaut actuellement 80 Euro(s) sur internet, je vous le vends donc pour 50 Euro(s) avec la coque en cadeau !  Mod??le : LT18i",
                "price": 50.00,
                "images_url": {
                    "small": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/e0a5bddfc205b940d8679680c3a0e08a6c1cb919.jpg",
                    "thumb": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/e0a5bddfc205b940d8679680c3a0e08a6c1cb919.jpg"
                },
                "creation_date": "2019-11-05T15:56:50+0000",
                "is_urgent": true
            },
            {
                "id": 1701863965,
                "category_id": 5,
                "title": "LEGO TRAIN PASSAGERS Pi??ce D??tach??e",
                "description": "LEGO Le train de passagers rouge Lego 7938 vrac de pi??ces d??tach??es pour agrandir votre train avec les rails ou le compl??ter avec des pi??ces toutes les pi??ces sont pr??sentes sur la photo je ne fais pas d'envoi Remise Paris ( je peux me deplacer sur 16, 15 ou 14 ieme)",
                "price": 37.00,
                "images_url": {
                    "small": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/40d3d4c3ee75786859e638146a0a3e3a405e757d.jpg",
                    "thumb": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/40d3d4c3ee75786859e638146a0a3e3a405e757d.jpg"
                },
                "creation_date": "2019-11-05T15:56:45+0000",
                "is_urgent": false
            }
        ]
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given a list of four valid and two invalid ClassifiedAds
    
    private func givenJSONWithAListOfFourValidAndTwoInvalidClassifiedAds() {
        let json =
        """
        [
            {
                "id": 1664493117,
                "category_id": 9,
                "title": "Professeur natif d'espagnol ?? domicile",
                "description": "Doctorant espagnol, ayant fait des ??tudes de linguistique compar??e fran??ais - espagnol et de traduction (th??me/version) 0 la Sorbonne, je vous propose des cours d'espagnol ?? domicile ?? Paris intramuros. Actuellement j'enseigne l'espagnol dans un lyc??e et j'ai plus de cinq ans d'exp??rience comme professeur particulier, ?? Paris et ?? Madrid. Tous les niveaux, tous les ??ges. Je m'adapte ?? vos besoins et vous propose une m??thode personnalis??e et dynamique, selon vos point forts et vos points faibles, pour mieux travailler votre :  - Expression orale - Compr??hension orale - Grammaire - Vocabulaire - Production ??crite - Compr??hension ??crite Tarif : 25 euros/heure",
                "price": 25.00,
                "images_url": {
                    "small": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/af9c43ff5a3b3692f9f1aa3c17d7b46d8b740311.jpg",
                    "thumb": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/af9c43ff5a3b3692f9f1aa3c17d7b46d8b740311.jpg"
                },
                "creation_date": "2019-11-05T15:56:55+0000",
                "is_urgent": false,
                "siret": "123 323 002"
            },
            {
                "id": 1077103477,
                "category_id": 2,
                "title": "Ensemble fille 1 mois NEUF",
                "description": "Vends Robe avec t-shirt neuf Presti Presto en 1 mois.",
                "price": 5.00,
                "images_url": {
                    "small": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/5ae4741dabd3a236cbfb8b6a5746acba6823e41e.jpg",
                    "thumb": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/5ae4741dabd3a236cbfb8b6a5746acba6823e41e.jpg"
                },
                "creation_date": "2019-11-05T15:56:52+0000",
                "is_urgent": true
            },
            {
                "id": 1671026575,
                "category_id": 8,
                "title": "Sony Ericsson Xperia Arc S + coque (occasion)",
                "description": "Je vends ce Sony Ericsson Xperia Arc S, TOUT fonctionne PARFAITEMENT.  Le t??l??phone pr??sente quelques traces d'usures (rayures). Un t??l??phone comme celui-ci vaut actuellement 80 Euro(s) sur internet, je vous le vends donc pour 50 Euro(s) avec la coque en cadeau !  Mod??le : LT18i",
                "price": 50.00,
                "images_url": {
                    "small": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/e0a5bddfc205b940d8679680c3a0e08a6c1cb919.jpg",
                    "thumb": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/e0a5bddfc205b940d8679680c3a0e08a6c1cb919.jpg"
                },
                "creation_date": "2019-11-05T15:56:50+0000",
                "is_urgent": true
            },
            {
                "id": 1701863965,
                "category_id": 5,
                "title": "LEGO TRAIN PASSAGERS Pi??ce D??tach??e",
                "description": "LEGO Le train de passagers rouge Lego 7938 vrac de pi??ces d??tach??es pour agrandir votre train avec les rails ou le compl??ter avec des pi??ces toutes les pi??ces sont pr??sentes sur la photo je ne fais pas d'envoi Remise Paris ( je peux me deplacer sur 16, 15 ou 14 ieme)",
                "price": 37.00,
                "images_url": {
                    "small": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/40d3d4c3ee75786859e638146a0a3e3a405e757d.jpg",
                    "thumb": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/40d3d4c3ee75786859e638146a0a3e3a405e757d.jpg"
                },
                "creation_date": "2019-11-05T15:56:45+0000",
                "is_urgent": false
            },
            {
                "category_id": 6,
                "title": "Boutique ?? c??der Oberkampf",
                "description": "Cause d??menagement en province, local commercial ?? c??der situ?? dans la dynamique rue Saint-Maur. Actuellement boutique de pr??t-??-porter avec une tr??s belle client??le. Id??al pr??t-??-porter, cr??ateur bijoux, D??p??t-vente etc... Pas de restauration avec extraction. Agences s'abstenir !",
                "price": 45000.00,
                "images_url": {
                    "small": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/c4ec3e7f665977a9922e934c25643a49db9a6f83.jpg",
                    "thumb": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/c4ec3e7f665977a9922e934c25643a49db9a6f83.jpg"
                },
                "creation_date": "2019-10-04T15:26:36+0000",
                "is_urgent": false,
                "siret": "476 324 343"
            },
            {
                "id": 1701846531,
                "category_id": 8,
                "description": "Bonjour Je vend cet objectif Sony FE Zeiss 35mm ouverture F 2.8 achet?? il y a 6 mois dans un ??tat pratiquement neuf et dans son emballage d'origine. Pour plus d'information envoyez moi un message",
                "price": 470.00,
                "images_url": {
                    "small": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/254308d0083d9293657d938f782c079bfa4a0b3a.jpg",
                    "thumb": "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/254308d0083d9293657d938f782c079bfa4a0b3a.jpg"
                },
                "creation_date": "2019-11-05T15:56:43+0000",
                "is_urgent": true
            }
        ]
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given an empty list of ClassifiedAds
    
    private func givenJSONWithAnEmptyListOfClassifiedAds() {
        let json =
        """
        [
        ]
        """
        
        makeData(with: json)
    }
}
