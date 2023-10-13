//
//  Showable.swift
//  Breath
//
//  Created by Alexander V. on 13.10.2023.
//

import UIKit

protocol Showable {
    func toShowable() -> UIViewController
}

extension UIViewController: Showable {
    public func toShowable() -> UIViewController { self }
}
