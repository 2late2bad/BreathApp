//
//  BAPrimaryButton.swift
//  UIComponents
//
//  Created by Alexander V. on 02.09.2023.
//

import UIKit
import RswiftResources

// MARK: - BAPrimaryButton
public final class BAPrimaryButton: UIButton {

    // MARK: - Properties
    let cornerRadius: CGFloat
    let titleText: String
    let fontSize: CGFloat

    // MARK: - Public init
    public init(cornerRadius: CGFloat = 12, title: String = "Enter", fontSize: CGFloat = 18) {
        self.cornerRadius = cornerRadius
        self.titleText = title
        self.fontSize = fontSize
        super.init(frame: .zero)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    private func setup() {
        backgroundColor = R.color.primaryInteraction()
        titleLabel?.font = R.font.montBlancTrialBold(size: fontSize)
        layer.cornerRadius = cornerRadius
        setTitle(titleText, for: .normal)
        setTitleColor(R.color.buttonText(), for: .normal)
    }
}
