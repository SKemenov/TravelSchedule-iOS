//
//  SearchNothingView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 24.04.2024.
//

import SwiftUI

struct SearchNothingView: View {
    @State var notification: String

    var body: some View {
        Spacer()
        Text(notification)
            .font(.boldMedium)
        Spacer()
    }
}

#Preview {
    SearchNothingView(notification: "Nothing is here")
}
