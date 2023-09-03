//
//  BAEyeButton.swift
//  UIComponents
//
//  Created by Alexander V. on 03.09.2023.
//

import UIKit
import RswiftResources

// MARK: - BAEyeButton
public final class BAEyeButton: UIButton {

    // MARK: - Public override init
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
        setImage(UIImage(systemName: "eye.slash"), for: .normal)
        tintColor = R.color.foregroundTextField()
        widthAnchor.constraint(equalToConstant: 40).isActive = true
        isEnabled = false
    }
}
