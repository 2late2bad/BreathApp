//
//  AuthViewModel.swift
//  Breath
//
//  Created by Alexander V. on 03.09.2023.
//

import Foundation
import Combine

// MARK: - AuthViewModel
final class AuthViewModel: ObservableObject {

    // MARK: - View state
    enum ViewState {
        case loading
        case success
        case failed(error: URLError)
        case none
    }

    // MARK: - Properties
    private let authManager: Authentification
    @Published var isAuth: Bool
    @Published var email = ""
    @Published var password = ""
    @Published var repeatPass = ""
    @Published var state: ViewState = .none

    // MARK: - Init
    init(isAuth: Bool = true, authManager: Authentification) {
        self.isAuth = isAuth
        self.authManager = authManager
    }

    // MARK: - Publishers
    var statusPublisher: AnyPublisher<Bool, Never> {
        $isAuth
            .map { $0 }
            .eraseToAnyPublisher()
    }

    var isValidEmailPublisher: AnyPublisher<Bool, Never> {
        $email
            .map { $0.isValidEmail }
            .eraseToAnyPublisher()
    }

    var isValidPasswordPublisher: AnyPublisher<Bool, Never> {
        $password
            .map { !$0.isEmpty && $0.count > 5 }
            .eraseToAnyPublisher()
    }

    var isValidRepeatPasswordPublisher: AnyPublisher<Bool, Never> {
        $repeatPass
            .map { !$0.isEmpty && $0.count > 5 }
            .eraseToAnyPublisher()
    }

    var validatedPasswords: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest($password, $repeatPass)
            .map { pass, repeatPass in
                guard pass == repeatPass, pass.count > 5 else { return false }
                return true
            }
            .eraseToAnyPublisher()
    }

    var isSumbitEnabled: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest4(statusPublisher,
                                  isValidEmailPublisher,
                                  isValidPasswordPublisher,
                                  validatedPasswords)
        .map { auth, emailCorrect, passCorrect, allPassCorrect in
            switch auth {
            case true:
                return emailCorrect && passCorrect
            case false:
                return emailCorrect && allPassCorrect
            }
        }
        .eraseToAnyPublisher()
    }

    // MARK: - Methods
    func submitLogin() async {
        state = .loading

        if isAuth {
            do {
                try await authManager.signIn(withEmail: email, password: password)
                self.state = .success
            } catch {
                self.state = .failed(error: error as! URLError) // todo
            }
        } else {
            do {
                try await authManager.createUser(withEmail: email, password: password)
                self.state = .success
            } catch {
                self.state = .failed(error: error as! URLError) // todo
            }
        }
    }
}
