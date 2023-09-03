//
//  BASubstrate.swift
//  UIComponents
//
//  Created by Alexander V. on 03.09.2023.
//

import UIKit
import RswiftResources

// MARK: - BASubstrate
public final class BASubstrate: UIView {

    // MARK: - Public init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    private func setup() {
        backgroundColor = R.color.substrate()
        layer.cornerRadius = 40
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
