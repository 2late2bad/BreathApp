//
//  UIButton+Ext.swift
//  UIComponents
//
//  Created by Alexander V. on 12.09.2023.
//

import UIKit

extension UIButton {

    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [
            .touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside
        ])
    }

    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: .identity.scaledBy(x: 0.95, y: 0.95))
    }

    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }

    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut]) {
            button.transform = transform
        } completion: { _ in }
    }
}
