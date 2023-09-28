//
//  ContentView.swift
//  OnboardSDK
//
//  Created by Alexander V. on 27.09.2023.
//

import SwiftUI
import UIComponents

struct ContentView: View {
    
    let data: OnboardModel
    @ObservedObject var viewModel: OnboardViewModel
    var doneRequest: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            MainInfoView(data: data)
                .padding(.horizontal, LocalPadding.horizontal.rawValue)
            
            if let tabBarModel = data.tabBarModel {
                InfoTabBarView(tabBarModel: tabBarModel)
                    .padding(.horizontal, 20)
            }
            
            Spacer()
            
            FooterButtonView(data: data, viewModel: viewModel, doneRequest: {
                doneRequest()
            })
            .padding(.horizontal, LocalPadding.horizontal.rawValue)
        }
    }
}
