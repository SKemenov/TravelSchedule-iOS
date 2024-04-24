//
//  SettingsView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 19.04.2024.
//

import SwiftUI

struct SettingsView: View {
    @Binding var darkMode: Bool

    var body: some View {
        VStack {
            Toggle("Switch is here", isOn: $darkMode)
            // NavigationLink(value: ViewsRouter.agreementView) {
            NavigationLink {
                AgreementView()
            } label: {
                RowSearchView(rowString: "User Agreement")
            }
            Spacer()
        }
    }
}

#Preview {
    SettingsView(darkMode: .constant(false))
}
