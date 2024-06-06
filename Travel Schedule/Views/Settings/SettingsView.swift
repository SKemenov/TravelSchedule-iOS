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
                .setRowElement()
                .tint(AppColors.Universal.blue)
            NavigationLink {
                AgreementView()
            } label: {
                RowSearchView(rowString: "Пользовательское соглашение")
            }
            .setRowElement()

            Spacer()

            VStack(alignment: .center, spacing: 16) {
                Text("Приложение использует API «Яндекс.Расписания»")
                Text("Версия \(Bundle.main.appVersionLong).\(Bundle.main.appBuild)")
            }
            .font(AppFonts.Regular.small)
            .frame(minHeight: AppSizes.Height.about)
        }
        .padding(.vertical, AppSizes.Spacing.xxLarge)
        .foregroundStyle(AppColors.LightDark.black)
    }
}

#Preview {
    NavigationStack {
        SettingsView(darkMode: .constant(false))
    }
}
