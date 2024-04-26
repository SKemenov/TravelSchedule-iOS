//
//  SearchBarView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 24.04.2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String

    // swiftlint:disable:next attributes
    @Environment(\.colorScheme) var colorScheme

    var placeholder = "Введите запрос"

    var body: some View {
        HStack(spacing: 0) {
            Image.iconSearching
                .resizable()
                .frame(width: .iconSize, height: .iconSize)
                .padding(.horizontal, .spacerS)
                .foregroundColor(searchText.isEmpty ? .ypGray : .ypBlackDuo)

            TextField(placeholder, text: $searchText)
                .font(.regMedium)
                .foregroundColor(.ypBlackDuo)
                .autocorrectionDisabled(true)
                .autocapitalization(.none)

            if !searchText.isEmpty {
                Button {
                    searchText = String()
                    UIApplication.shared.sendAction(
                        #selector(UIResponder.resignFirstResponder),
                        to: nil,
                        from: nil,
                        for: nil
                    )
                } label: {
                    Image.iconSearchCancel
                        .resizable()
                        .frame(width: .iconSize, height: .iconSize)
                        .padding(.horizontal, .spacerS)
                        .foregroundColor(.ypGray)
                }
            }
        }
        .frame(height: 36)
        .background(colorScheme == .light ? .ypLightGray : .ypDarkGray)
        .cornerRadius(10)
        .padding(.horizontal, .spacerL)
    }
}
