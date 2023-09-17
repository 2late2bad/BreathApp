//
//  BaseLabel.swift
//  UIComponents
//
//  Created by Alexander V. on 12.09.2023.
//

import UIKit

open class BaseLabel: UILabel {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal func setup() {}
}
