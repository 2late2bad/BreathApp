//
//  BAPrimaryButton.swift
//  UIComponents
//
//  Created by Alexander V. on 16.09.2023.
//

import UIKit
import RswiftResources

// MARK: - BAPrimaryButton
public class BAPrimaryButton: UIButton {

    public var callback: (() -> Void)?

    // MARK: - Properties
    let cornerRadius: CGFloat
    let titleText: String
    let fontSize: CGFloat
    private let height: CGFloat

    // MARK: - Public init
    public init(cornerRadius: CGFloat = 12, title: String = "Enter", fontSize: CGFloat = 18, height: CGFloat = 40) {
        self.cornerRadius = cornerRadius
        self.titleText = title
        self.fontSize = fontSize
        self.height = height
        super.init(frame: .zero)

        setup()
        startAnimatingPressActions()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func updateTitle(for newTitle: String) {
        UIView.animate(withDuration: 0.2) {
            self.titleLabel?.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.setTitle(newTitle, for: .normal)
                self.titleLabel?.alpha = 1
            }
        }
    }

    // MARK: - Private methods
    private func setup() {
        backgroundColor = R.color.primaryInteraction()
        titleLabel?.font = R.font.montBlancTrialBold(size: fontSize)
        layer.cornerRadius = cornerRadius
        setTitle(titleText, for: .normal)
        setTitleColor(R.color.buttonText(), for: .normal)
        addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        snp.makeConstraints { $0.height.equalTo(height) }
    }
}

public extension BAPrimaryButton {
    @IBAction func buttonHandler() { callback?() }
}
