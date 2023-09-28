//
//  PageControlView.swift
//  OnboardSDK
//
//  Created by Alexander V. on 28.09.2023.
//

import SwiftUI

struct PageControlView: View {
    
    @ObservedObject var viewModel: OnboardViewModel
    let geometry: GeometryProxy
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(OnboardModel.shared.indices, id: \.self) { i in
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: viewModel.widthSelectorPageControl(geometry),
                           height: 3)
                    .foregroundColor(i == viewModel.selectedPage ?
                        .white : .white.opacity(0.5))
                    .onTapGesture {
                        viewModel.onTapSelectorPageController(i)
                    }
            }
        }
    }
}
