//
//  BATextField.swift
//  UIComponents
//
//  Created by Alexander V. on 12.09.2023.
//

import UIKit

public class BATextField: BaseTextField {

    public enum BATextFieldType {
        case username
        case email
        case password
        case custom
    }

    // MARK: - Private Properties
    private let cornerRadius: CGFloat
    private let placeholderText: String
    private let fontSize: CGFloat
    private let padding: UIEdgeInsets
    public let eyeButton: UIButton
    private let typeTextField: BATextFieldType
    private let height: CGFloat

    // MARK: - Public init
    public init(cornerRadius: CGFloat = 12,
                placeholder: String = "Enter",
                fontSize: CGFloat = 14,
                height: CGFloat = 40,
                type: BATextFieldType) {
        self.cornerRadius = cornerRadius
        self.placeholderText = placeholder
        self.fontSize = fontSize
        self.typeTextField = type
        self.height = height
        eyeButton = BAEyeButton()

        switch typeTextField {
        case .username, .email, .custom:
            self.padding = .init(top: 0, left: 10, bottom: 0, right: 10)
        case .password:
            self.padding = .init(top: 0, left: 10, bottom: 0, right: 40)
        }
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
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
    override func setup() {
        returnKeyType = .done
        autocorrectionType = .no
        autocapitalizationType = .none
        rightViewMode = .never

        switch typeTextField {
        case .username, .custom:
            break
        case .email:
            keyboardType = .emailAddress
            textContentType = .emailAddress
        case .password:
            textContentType = .oneTimeCode
            isSecureTextEntry = true
            rightView = eyeButton
            rightViewMode = .always
            eyeButton.addTarget(self, action: #selector(displayBookMarks), for: .touchUpInside)
        }

        layer.cornerRadius = 12
        layer.backgroundColor = R.color.authTextField()?.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.1

        attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor:
                        R.color.authForegroundTextField() ?? .black.withAlphaComponent(0.3)]
        )
        font = .systemFont(ofSize: fontSize, weight: .light)

        snp.makeConstraints { $0.height.equalTo(height) }
    }

    @objc
    private func displayBookMarks() {
        let imageName = isSecureTextEntry ? "eye" : "eye.slash"
        isSecureTextEntry.toggle()
        eyeButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
