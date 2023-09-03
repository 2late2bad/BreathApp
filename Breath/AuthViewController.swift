//
//  AuthViewController.swift
//  Breath
//
//  Created by Alexander V. on 03.09.2023.
//

import UIKit
import UIComponents
import SnapKit

final class AuthViewController: UIViewController {

    private let perfomanceView = BAPerfomanceView()
    private let substrate = BASubstrate()
    private let enterButton = BAPrimaryButton(title: "Войти")
    private let switchView = BAAuthSwitchView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        test()
    }

    private func test() {
        view.addSubview(perfomanceView)
        view.addSubview(substrate)
        view.addSubview(enterButton)
        view.addSubview(switchView)
        view.sendSubviewToBack(substrate)

        perfomanceView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(40)
            make.center.equalToSuperview()
        }

        substrate.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(perfomanceView.snp.bottom).offset(40)
        }

        enterButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(40)
            make.top.equalTo(substrate.snp.bottom).offset(25)
        }

        switchView.snp.makeConstraints { make in
            make.bottomMargin.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
        }
    }
}
