//
//  OnboardView.swift
//  OnboardSDK
//
//  Created by Alexander V. on 02.09.2023.
//

import SwiftUI

public struct OnboardView: View {

    public var doneRequest: () -> Void
    public init(doneRequest: @escaping () -> Void) {
        self.doneRequest = doneRequest
    }

    public var body: some View {
        TabView {
            ScaledImageView(name: "circle")
                .tag(0)
            ScaledImageView(name: "heart.fill")
                .tag(1)
            ScaledImageView(name: "pencil")
                .tag(2)
            Button("Done") {
                doneRequest()
            }
        }
        .tabViewStyle(.page)
        .background(Color.black.ignoresSafeArea(.all))
    }
}

public struct ScaledImageView: View {

    public let name: String

    public var body: some View {
        Image(systemName: name)
            .resizable()
            .scaledToFit()
            .foregroundColor(.blue)
    }
}

//struct OnboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardView(doneRequest: { })
//    }
//}
