//
//  AgreementView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 22.04.2024.
//

import SwiftUI


struct AgreementView: View {
    private let title = "Пользовательское соглашение"
    private let urlString = "https://developer.apple.com/documentation/technologies"
    // private let urlString = "https://yandex.ru/legal/practicum_offer" // this url doesn't support dark mode

    @State private var isPresentWebView = false

    var body: some View {
        VStack {
            switch Bool.random() {
                case true:
                    if let url = URL(string: urlString) {
                        WebView(url: url)
                            .ignoresSafeArea(.all, edges: .bottom)
                            .setCustomNavigationBar(title: title)
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
