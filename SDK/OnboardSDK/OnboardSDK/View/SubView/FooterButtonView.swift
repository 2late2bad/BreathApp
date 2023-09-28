//
//  FooterButtonView.swift
//  OnboardSDK
//
//  Created by Alexander V. on 28.09.2023.
//

import SwiftUI
import UIComponents

struct FooterButtonView: View {
    
    let data: OnboardModel
    @ObservedObject var viewModel: OnboardViewModel
    var doneRequest: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                viewModel.onTapDoneButton()
                if viewModel.selectedPage + 1 != OnboardModel.shared.count {
                    viewModel.selectedPage += 1
                } else {
                    doneRequest()
                }
            }, label: {
                Text(data.buttonText)
                    .font(.custom(R.font.montBlancTrialSemiBold, size: 20))
                    .foregroundColor(.white)
                    .frame(height: 47)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 3)
                    .background(Color(R.color.primaryInteraction() ?? .green))
                    .cornerRadius(16)
            })
            
            Button(action: {
                doneRequest()
            }, label: {
                Text("Пропустить")
                    .foregroundColor(.black.opacity(0.5))
            })
            .disabled(viewModel.selectedPage == OnboardModel.shared.endIndex - 1)
            .opacity(viewModel.selectedPage == OnboardModel.shared.endIndex - 1 ? 0 : 1)
        }
    }
}
