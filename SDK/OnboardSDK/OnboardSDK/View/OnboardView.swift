//
//  OnboardView.swift
//  OnboardSDK
//
//  Created by Alexander V. on 02.09.2023.
//

import SwiftUI
import UIComponents

public struct OnboardView: View {
    
    @StateObject var viewModel = OnboardViewModel()
    
    public var doneRequest: () -> Void
    public init(doneRequest: @escaping () -> Void) {
        self.doneRequest = doneRequest
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(colors: [
                    Color(R.color.onboardGradientTop() ?? .white),
                    Color(R.color.onboardGradientBottom() ?? .white)
                ], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack {
                    PageControlView(viewModel: viewModel, geometry: geometry)
                        .padding(.horizontal, LocalPadding.horizontal.rawValue)
                    
                    TabView(selection: $viewModel.selectedPage) {
                        ForEach(OnboardModel.shared.indices, id: \.self) { i in
                            ContentView(data: OnboardModel.shared[i],
                                        viewModel: viewModel) { doneRequest() }
                                .tag(i)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .ignoresSafeArea()
                }
                .padding(.vertical, 20)
            }
            .animation(.easeIn(duration: 0.1), value: viewModel.selectedPage)
            .disabled(viewModel.statusDisabled)
        }
    }
}
