//
//  ClassifiedAdDetailPresenter.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 21/12/2021.
//

import Foundation

class ClassifiedAdDetailPresenter {
    
    private weak var displayer: ClassifiedAdDetailDisplayable?
    
    init(displayer: ClassifiedAdDetailDisplayable) {
        self.displayer = displayer
    }
}

// MARK: - Interactor -> Presenter

extension ClassifiedAdDetailPresenter: ClassifiedAdDetailPresentable {
}
