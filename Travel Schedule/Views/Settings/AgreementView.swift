//
//  AgreementView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 22.04.2024.
//

import SwiftUI


struct AgreementView: View {
    @State private var isPresentWebView = false

    var body: some View {
        VStack {
            switch Bool.random() {
            case true:
                if let url = URL(string: "https://yandex.ru/legal/practicum_offer") {
                    WebView(url: url)
                        .ignoresSafeArea(.all, edges: .bottom)
                        .setCustomNavigationBar(title: "Пользовательское соглашение")
                }
            case false:
                ErrorView(errorType: Bool.random() ? .connectionError : .serverError)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AgreementView()
    }
}
