//
//  Authentification.swift
//  Breath
//
//  Created by Alexander V. on 17.09.2023.
//

import Foundation
import Firebase

protocol Authentification {
    var userSession: FirebaseAuth.User? { get }
    var currentUser: UserModel? { get }
    func signIn(withEmail email: String, password: String) async throws
    func createUser(withEmail email: String, password: String) async throws
    func signOut()
    func deleteAccount()
    func fetchUser() async
}
