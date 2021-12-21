//
//  DateFormatter+UI.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 21/12/2021.
//

import Foundation

extension DateFormatter {
    
    /// le d MMMM yyyy à HH:mm (le 21 décembre 2021 à 11h19)
    static var creationDateDisplayFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy 'à' HH:mm"
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        dateFormatter.isLenient = true
        return dateFormatter
    }()
}
