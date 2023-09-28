//
//  OnboardViewModel.swift
//  OnboardSDK
//
//  Created by Alexander V. on 27.09.2023.
//

import Foundation
import SwiftUI

enum LocalPadding: CGFloat {
    case horizontal = 40
}

final class OnboardViewModel: ObservableObject {
    
    @Published var selectedPage: Int = 0
    @Published var statusDisabled = false
    
    func widthSelectorPageControl(_ geometry: GeometryProxy) -> CGFloat {
        let widthExcludingPadding = geometry.size.width - LocalPadding.horizontal.rawValue * 2
        let sumIndentsBetweenElements = widthExcludingPadding - 8 * CGFloat(OnboardModel.shared.count - 1)
        return sumIndentsBetweenElements / CGFloat(OnboardModel.shared.count)
    }
    
    func onTapSelectorPageController(_ i: Int) {
        if i < selectedPage {
            withAnimation { selectedPage -= 1 }
        } else if i > selectedPage {
            withAnimation { selectedPage += 1 }
        }
    }
    
    func onTapDoneButton() {
        statusDisabled = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            guard let self else { return }
            self.statusDisabled = false
        }
    }
}
