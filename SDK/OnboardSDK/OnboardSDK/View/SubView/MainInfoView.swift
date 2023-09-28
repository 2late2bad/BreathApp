//
//  MainInfoView.swift
//  OnboardSDK
//
//  Created by Alexander V. on 28.09.2023.
//

import SwiftUI
import UIComponents

struct MainInfoView: View {
    
    let data: OnboardModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            if let image = data.image {
                Image(systemName: image)
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .opacity(0.8)
            }
            if !data.mainText.isEmpty {
                Text(data.mainText)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.custom(R.font.montBlancTrialSemiBold, size: 36))
            }
            Text(data.description)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .font(.custom(R.font.montBlancTrialRegular, size: 22))
        }
    }
}
