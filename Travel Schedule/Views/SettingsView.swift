//
//  SettingsView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 19.04.2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Switch is here")
            NavigationLink(value: Screens.agreementView) {
                RowSearchView(rowString: "User Agreement")
            }
            Spacer()
        }
    }
}

#Preview {
    SettingsView()
}
