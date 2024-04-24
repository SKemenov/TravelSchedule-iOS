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
        HStack {
            Text(rowString)
            Spacer()
            Image(systemName: "chevron.forward")
        }
        .padding()
    }
}

#Preview {
    RowSearchView(rowString: "Moscow")
}
