//
//  DetailListView.swift
//  List Down
//
//  Created by Jaimin Raval on 10/07/26.
//

import SwiftUI

struct DetailView: View {
    let fruitName: String

    var body: some View {
        VStack(spacing: 16) {
            Text(fruitName)
                .font(.largeTitle)
                .bold()

            Text("You selected \(fruitName) from the list.")
                .foregroundStyle(.secondary)
        }
        .padding()
        .navigationTitle(fruitName)
    }
}

#Preview {
    NavigationStack {
        DetailView(fruitName: "Apples")
    }
}
