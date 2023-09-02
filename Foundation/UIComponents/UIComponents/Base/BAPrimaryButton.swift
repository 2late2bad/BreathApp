//
//  BAPrimaryButton.swift
//  UIComponents
//
//  Created by Alexander V. on 02.09.2023.
//

import UIKit
import RswiftResources

public final class BAPrimaryButton: UIButton {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BAPrimaryButton {

    private func setup() {
        backgroundColor = R.color.primaryInteraction()
        layer.cornerRadius = 12
    }
}
