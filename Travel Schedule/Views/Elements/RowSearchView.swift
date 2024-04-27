//
//  RowSearchView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 22.04.2024.
//

import SwiftUI

struct RowSearchView: View {
    @State var rowString: String

    var body: some View {
        HStack(spacing: 0) {
            Text(rowString)
                .font(.regMedium)
            Spacer()
            Image(systemName: "chevron.forward")
                .imageScale(.large)
        }
    }
}

#Preview {
    RowSearchView(rowString: "Moscow")
}
