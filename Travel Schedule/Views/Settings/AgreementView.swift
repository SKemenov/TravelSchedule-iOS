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
        // Text("User Agreement here!")
        if let url = URL(string: "https://yandex.ru/legal/practicum_offer") {
            WebView(url: url)
                .ignoresSafeArea()
                .setCustomNavigationBar(title: "Пользовательское соглашение")
        } else {
            ErrorView(errorType: .connectionError)
        }
    }
}

#Preview {
    NavigationStack {
        AgreementView()
    }
}
