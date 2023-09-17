//
//  String+Ext.swift
//  Breath
//
//  Created by Alexander V. on 17.09.2023.
//

import Foundation

extension String {

    var isValidEmail: Bool {
        NSPredicate(
            format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        )
        .evaluate(with: self)
    }
}
