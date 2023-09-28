//
//  InfoTabBarView.swift
//  OnboardSDK
//
//  Created by Alexander V. on 28.09.2023.
//

import SwiftUI
import UIComponents

struct InfoTabBarView: View {
    
    let tabBarModel: [TabBarModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(tabBarModel) { model in
                HStack(spacing: 18) {
                    Image(systemName: model.image)
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .opacity(0.8)
                    Text(model.description)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .font(.custom(R.font.montBlancTrialSemiBold, size: 15))
                        .minimumScaleFactor(0.8)
                }
                .padding(.all, 16)
                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.white.opacity(0.2)))
            }
        }
    }
}
