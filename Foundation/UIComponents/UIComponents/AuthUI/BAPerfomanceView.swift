//
//  BAPerfomanceView.swift
//  UIComponents
//
//  Created by Alexander V. on 03.09.2023.
//

import UIKit
import RswiftResources
import SnapKit

public final class BAPerfomanceView: UIStackView {

    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.textAlignment = .center
        label.textColor = R.color.perfomanceLabel()
        label.font = R.font.montBlancTrialBold(size: 22)
        return label
    }()
    private let loginTextField = BATextField(placeholder: "Email", security: false)
    private let passwordTextField = BATextField(placeholder: "Пароль", security: true)
    private let repeatPasswordTextField = BATextField(placeholder: "Повторите пароль", security: true)

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        axis = .vertical
        spacing = 18
        addArrangedSubview(mainLabel)
        addArrangedSubview(loginTextField)
        addArrangedSubview(passwordTextField)
        addArrangedSubview(repeatPasswordTextField)
    }
}
