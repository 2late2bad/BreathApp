//
//  Coordinator.swift
//  Breath
//
//  Created by Alexander V. on 02.09.2023.
//

import Foundation

typealias CoordinatorHandler = () -> Void

protocol Coordinator: AnyObject {
    func start()
    var flowCompletionHandler: CoordinatorHandler? { get set }
}
