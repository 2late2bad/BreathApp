//
//  BALabel.swift
//  UIComponents
//
//  Created by Alexander V. on 12.09.2023.
//

import UIKit

public class BALabel: BaseLabel {

    public init(text: String = "", font: UIFont?, color: UIColor?, align: NSTextAlignment) {
        super.init(frame: .zero)

        self.text = text
        self.font = font
        self.textColor = color
        self.textAlignment = align
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setup() {
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.7
    }
}
