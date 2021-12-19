//
//  DateFormatter+Formatters.swift
//  Annonces_Entities
//
//  Created by Lucas VERCELOT on 17/12/2021.
//

import Foundation

extension DateFormatter {

    static var classifiedAdDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        dateFormatter.isLenient = true
        return dateFormatter
    }()
}
