//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Ivan on 09.04.2025.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

