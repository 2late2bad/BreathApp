//
//  FlowController.swift
//  Breath
//
//  Created by Alexander V. on 16.09.2023.
//

import Foundation

protocol FlowController {
    associatedtype T
    var completionHandler: ((T) -> Void)? { get set }
}
