//
//  BAAuthSwitchView.swift
//  UIComponents
//
//  Created by Alexander V. on 03.09.2023.
//

import UIKit
import RswiftResources
import SnapKit

public final class BAAuthSwitchView: UIView {

    private let mainLabel = UILabel()
    private let switchButton = UIButton()
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLabel()
        setupButton()
        layoutUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension BAAuthSwitchView {
    @IBAction func buttonHandler() {
        print("Switch button pressed")
    }
}

private extension BAAuthSwitchView {

    func setupView() {
        backgroundColor = R.color.substrate()?.withAlphaComponent(0.2)

        layer.cornerRadius = 33
        layer.cornerCurve = .continuous

        addSubview(stackView)
        stackView.addArrangedSubview(mainLabel)
        stackView.addArrangedSubview(switchButton)
    }

    func setupLabel() {
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 1
        mainLabel.font = R.font.montBlancTrialExtraLight(size: 14)
        mainLabel.textColor = R.color.authLabelText()
        mainLabel.adjustsFontSizeToFitWidth = true
        mainLabel.minimumScaleFactor = 0.8
        mainLabel.text = "Нет аккаунта?"
    }

    func setupButton() {
        switchButton.titleLabel?.font = R.font.montBlancTrialSemiBold(size: 14)
        switchButton.setTitle("Зарегистрироваться", for: .normal)
        switchButton.setTitleColor(R.color.authButtonText(), for: .normal)
        switchButton.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
    }

    func layoutUI() {
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.left.right.equalToSuperview().inset(20)
        }
    }
}
