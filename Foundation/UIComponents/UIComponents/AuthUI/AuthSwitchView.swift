//
//  AuthSwitchView.swift
//  UIComponents
//
//  Created by Alexander V. on 16.09.2023.
//

import UIKit
import RswiftResources
import SnapKit

public final class AuthSwitchView: UIView {

    public var callback: ((Bool) -> Void)?

    private let mainLabel = UILabel()
    private let switchButton = UIButton()
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    private let animationTimeInterbal: TimeInterval = 0.25
    private var isAuth: Bool
    private var textLabel: String { isAuth ? "Нет аккаунта?" : "Есть аккаунт?"}
    private var buttonLabel: String { isAuth ? "Зарегистрироваться" : "Войти" }

//    public override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//        setupLabel()
//        setupButton()
//        layoutUI()
//    }

    public init(isAuth: Bool) {
        self.isAuth = isAuth
        super.init(frame: .zero)
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

public extension AuthSwitchView {
    @IBAction func buttonHandler() {
        isAuth.toggle()
        animateTextChange()
        callback?(isAuth)
    }

    func test() {
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = R.color.substrate()?.withAlphaComponent(0)
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {

                self.backgroundColor = R.color.substrate()?.withAlphaComponent(0.2)
            }
        }
    }
}

private extension AuthSwitchView {

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
        mainLabel.text = textLabel
    }

    func setupButton() {
        switchButton.titleLabel?.font = R.font.montBlancTrialSemiBold(size: 14)
        switchButton.setTitle(buttonLabel, for: .normal)
        switchButton.setTitleColor(R.color.authButtonText(), for: .normal)
        switchButton.titleLabel?.adjustsFontSizeToFitWidth = true
        switchButton.titleLabel?.lineBreakMode = .byClipping
        switchButton.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
    }

    func layoutUI() {
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.left.right.equalToSuperview().inset(20)
        }
    }
}

private extension AuthSwitchView {

    func animateTextChange() {
        UIView.animate(withDuration: animationTimeInterbal) {
            self.mainLabel.alpha = 0
            self.switchButton.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: self.animationTimeInterbal) {
                self.mainLabel.text = self.textLabel
                self.switchButton.setTitle(self.buttonLabel, for: .normal)
                self.mainLabel.alpha = 1
                self.switchButton.alpha = 1
            }
        }
    }
}
