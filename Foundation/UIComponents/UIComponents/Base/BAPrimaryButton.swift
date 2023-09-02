//
//  BAPrimaryButton.swift
//  UIComponents
//
//  Created by Alexander V. on 02.09.2023.
//

import UIKit
import RswiftResources

public final class BAPrimaryButton: UIButton {

    let cornerRadius: CGFloat
    let titleText: String

    public init(cornerRadius: CGFloat = 12, title: String = "Enter") {
        self.cornerRadius = cornerRadius
        self.titleText = title
        super.init(frame: .zero)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BAPrimaryButton {

    func setup() {
        UIFont.registerFonts(from: Bundle.uiComponents)
        backgroundColor = R.color.primaryInteraction()
        titleLabel?.font = R.font.montBlancTrialBold(size: 18)
        layer.cornerRadius = cornerRadius
        setTitle(titleText, for: .normal)
        setTitleColor(R.color.primaryText(), for: .normal)
    }
}
