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
        VStack(spacing: 0) {
            Toggle("Тёмная тема", isOn: $darkMode)
                .font(.regMedium)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, maxHeight: 60)
                .tint(.ypBlue)
            NavigationLink {
                AgreementView()
            } label: {
                RowSearchView(rowString: "Пользовательское соглашение")
            }
            .font(.regMedium)
            .padding(16)
            .frame(maxWidth: .infinity, maxHeight: 60)
            Spacer()
            VStack(alignment: .center, spacing: 16) {
                Text("Приложение использует API «Яндекс.Расписания»")
                Text("Версия \(Bundle.main.appVersionLong).\(Bundle.main.appBuild)")
            }
            .font(.regSmall)
            .frame(minHeight: 44)
        }
        .padding(.vertical, 24)
        .foregroundColor(.ypBlackDuo)
    }
}

#Preview {
    NavigationStack {
        SettingsView(darkMode: .constant(false))
    }
}
