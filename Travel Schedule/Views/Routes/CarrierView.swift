//
//  CarrierView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 24.04.2024.
//

import SwiftUI

struct CarrierView: View {
    @State var carrier: Carrier
    // swiftlint:disable:next attributes
    @Environment(\.openURL) private var openURL

    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Image(carrier.logoName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 104)
                .background(.ypWhite)
                .clipShape(RoundedRectangle(cornerRadius: 24))
            Text("ОАО «\(carrier.title)»")
                .font(.boldMedium)
                .frame(maxWidth: .infinity, maxHeight: 29, alignment: .leading)
                .padding(.vertical, .spacerL)
            VStack(alignment: .leading, spacing: 0) {
                Text("E-mail")
                    .font(.regMedium)
                    .foregroundStyle(.ypBlackDuo)
                Button {
                    guard let url = URL(string: "mailto:" + carrier.email) else { return }
                    openURL(url)
                } label: {
                    Text("\(carrier.email)")
                        .font(.regSmall)
                    .foregroundStyle(.ypBlue)
                }
            }
            .frame(height: 60)
            VStack(alignment: .leading, spacing: 0) {
                Text("Телефон")
                    .font(.regMedium)
                    .foregroundStyle(.ypBlackDuo)
                Button {
                    guard let url = URL(string: "tel:" + carrier.phone) else { return }
                    openURL(url)
                } label: {
                    Text("\(carrier.phone)")
                        .font(.regSmall)
                    .foregroundStyle(.ypBlue)
                }
            }
            .frame(height: 60)
            Spacer()
        }
        .setCustomNavigationBar(title: "ИНформация о перевозчике")
        .padding(.horizontal, AppSizes.Spacing.large)
    }
}

#Preview {
    NavigationStack {
        CarrierView(carrier: Carrier.sampleData[0])
    }
}
