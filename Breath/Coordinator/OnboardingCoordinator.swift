//
//  OnboardingCoordinator.swift
//  Breath
//
//  Created by Alexander V. on 02.09.2023.
//

import Foundation
import SwiftUI
import OnboardSDK

final class OnboardingCoordinator: Coordinator {

    var rootViewController: UIViewController

    init() {
        rootViewController = UIViewController()
    }

    func start() {
        let view = OnboardView {
            // guard let self else { return }
        }
        rootViewController = UIHostingController(rootView: view)
    }
}
