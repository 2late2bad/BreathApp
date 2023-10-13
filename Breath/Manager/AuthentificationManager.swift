//
//  AuthentificationManager.swift
//  Breath
//
//  Created by Alexander V. on 16.09.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

final class AuthentificationManager: Authentification {

    static let instance = AuthentificationManager()

    var userSession: FirebaseAuth.User?
    var currentUser: UserModel? {
        willSet {
            // print("\(newValue) ___ \(Date())")
        }
    }

    private init() {
        self.userSession = Auth.auth().currentUser

        Task {
            await fetchUser()
        }
    }

    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            throw URLError(.badURL)
            // print(">DEBUG: Ошибка авторизации юзера: \(error.localizedDescription)")
        }
    }

    func createUser(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = UserModel(id: result.user.uid, email: email, fullname: nil, photoUrl: nil)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            // print(">DEBUG: Ошибка создания юзера: \(error.localizedDescription)")
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            // print(">DEBUG: Неуспешная попытка выхода пользователя: \(error.localizedDescription)")
        }
    }

    func deleteAccount() {

    }

    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid,
              let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument()
        else { return }
        self.currentUser = try? snapshot.data(as: UserModel.self)
    }
}
