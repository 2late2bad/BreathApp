//
//  Router.swift
//  Breath
//
//  Created by Alexander V. on 13.10.2023.
//

import UIKit

protocol Router {
    var navigationController: UINavigationController { get }
    var rootViewContoller: UIViewController? { get }
    func present(_ module: Showable, animated: Bool)
    func push(_ module: Showable, animated: Bool, completion: (()->Void)?)
    func pop(animated: Bool)
}
