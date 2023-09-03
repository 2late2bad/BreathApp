//
//  BATextField.swift
//  UIComponents
//
//  Created by Alexander V. on 03.09.2023.
//

import UIKit
import RswiftResources

// MARK: - BATextField
public final class BATextField: UITextField {

    // MARK: - Private Properties
    private let cornerRadius: CGFloat
    private let placeholderText: String
    private let fontSize: CGFloat
    private let padding: UIEdgeInsets
    private let eyeButton: UIButton
    private let security: Bool

    // MARK: - Public init
    public init(cornerRadius: CGFloat = 12,
                placeholder: String = "Enter",
                fontSize: CGFloat = 14,
                height: CGFloat = 40,
                security: Bool) {
        self.cornerRadius = cornerRadius
        self.placeholderText = placeholder
        self.fontSize = fontSize
        self.security = security
        eyeButton = BAEyeButton()
        if security {
            self.padding = .init(top: 0, left: 10, bottom: 0, right: 40)
        } else {
            self.padding = .init(top: 0, left: 10, bottom: 0, right: 10)
        }
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override methods
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    // MARK: - Private methods
    private func setup() {
        delegate = self

        layer.cornerRadius = 12
        layer.backgroundColor = R.color.backTextField()?.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 20
        layer.shadowOpacity = 0.2

        attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor:
                        R.color.foregroundTextField() ?? .black.withAlphaComponent(0.3)]
        )
        font = R.font.montBlancTrialExtraLight(size: fontSize)

        snp.makeConstraints { make in
            make.height.equalTo(40)
        }

        rightViewMode = .never
        isSecureTextEntry = false
        if security {
            rightView = eyeButton
            rightViewMode = .always
            isSecureTextEntry = true
            eyeButton.addTarget(self, action: #selector(displayBookMarks), for: .touchUpInside)
        }
    }

    @objc
    private func displayBookMarks() {
        let imageName = isSecureTextEntry ? "eye" : "eye.slash"
        isSecureTextEntry.toggle()
        eyeButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}

// MARK: - UITextFieldDelegate
extension BATextField: UITextFieldDelegate {

    public func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        eyeButton.isEnabled = !text.isEmpty
    }
}
