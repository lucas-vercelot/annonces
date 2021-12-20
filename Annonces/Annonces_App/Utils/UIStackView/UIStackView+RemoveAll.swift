//
//  UIStackView+RemoveAll.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 20/12/2021.
//

import Foundation
import UIKit

extension UIStackView {
    
    public func removeAllArrangedSubviews() {
        for view in arrangedSubviews {
            removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
}
