//
//  UserModel.swift
//  Breath
//
//  Created by Alexander V. on 16.09.2023.
//

import Foundation

// MARK: - UserModel
struct UserModel: Identifiable, Codable {
    let id: String
    let email: String
    let fullname: String?
    let photoUrl: String?

    var initials: String {
        guard let fullname else { return "" }
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}
