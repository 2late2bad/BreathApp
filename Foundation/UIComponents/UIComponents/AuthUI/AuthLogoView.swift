//
//  AuthLogoView.swift
//  UIComponents
//
//  Created by Alexander V. on 12.09.2023.
//

import UIKit
import RswiftResources
import SnapKit

public final class AuthLogoView: UIView {

    private let logoImageView: LogoImageView
    private let titleLabel: BALabel
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()

    public init(title: String = "Breath", image: UIImage? = R.image.logoWhiteOpacity()) {
        logoImageView = LogoImageView(image: image)
        titleLabel = BALabel(text: title.uppercased(),
                             font: R.font.montBlancTrialSemiBold(size: 50),
                             color: R.color.authText(),
                             align: .center)
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(stackView)
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(titleLabel)

        logoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
