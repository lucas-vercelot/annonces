//
//  ClassifiedAdDetailInteractor.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 21/12/2021.
//

import Foundation

class ClassifiedAdDetailInteractor {
    
    // MARK: - Vars
    
    private let presenter: ClassifiedAdDetailPresentable
    
    // MARK: - Init
    
    init(presenter: ClassifiedAdDetailPresentable) {
        self.presenter = presenter
    }
}

// MARK: - ViewController -> Interactor

extension ClassifiedAdDetailInteractor: ClassifiedAdDetailInteractable {
}
