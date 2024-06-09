//
//  ButtonTitleView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 03.06.2024.
//

import SwiftUI

struct ButtonTitleView: View {
    let title: String
    var body: some View {
        Text(title)
            .font(AppFonts.Bold.small)
    }
}

#Preview {
    ButtonTitleView(title: "Уточнить время")
}
