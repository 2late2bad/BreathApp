//
//  BAImageView.swift
//  UIComponents
//
//  Created by Alexander V. on 12.09.2023.
//

import UIKit

public class BAImageView: BaseImageView {

    public let imageLogo: UIImage?
    public let content: UIView.ContentMode

    public init(image: UIImage?, content: UIView.ContentMode) {
        imageLogo = image
        self.content = content
        super.init(frame: .zero)

        setup()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setup() {
        image = imageLogo
        contentMode = content
    }
}
