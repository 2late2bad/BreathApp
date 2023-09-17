//
//  LogoImageView.swift
//  UIComponents
//
//  Created by Alexander V. on 12.09.2023.
//

import UIKit
import RswiftResources
import SnapKit

final class LogoImageView: UIView {

    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.authLogoBackground()
        return view
    }()
    private let imageView: BAImageView

    init(image: UIImage? = R.image.logoWhiteOpacity()) {
        imageView = BAImageView(image: image, content: .scaleAspectFit)
        super.init(frame: .zero)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundView.layer.cornerRadius = backgroundView.frame.width / 2
        backgroundView.clipsToBounds = true
        backgroundView.layer.masksToBounds = true
        backgroundView.layer.cornerCurve = .continuous
    }

    private func setup() {
        addSubview(backgroundView)
        backgroundView.addSubview(imageView)

        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalToSuperview().multipliedBy(0.8)
        }
    }
}
