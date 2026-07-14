//
//  DetailListView.swift
//  List Down
//
//  Created by Jaimin Raval on 10/07/26.
//

//
//  DetailView.swift
//  List Down
//
//  Created by Jaimin Raval on 07/07/26.
//

import SwiftUI

struct DetailView: View {
    // @Binding means: "I don't own this value. I'm borrowing a live reference
    // to a @State variable that lives in some OTHER view (the parent)."
    //
    // Think of @State as the actual box that holds the value,
    // and @Binding as a remote control to that same box
    // read from it, write to it, and the parent's box updates instantly.
    //
    // This is different from a plain `let fruitName: String`, which is just
    // a COPY. Editing a copy never affects the original in the parent.
    @Binding var fruitName: String

    var body: some View {
        VStack(spacing: 16) {
            Text("Editing:")
                .foregroundStyle(.secondary)

            // Because fruitName is a Binding, we can pass it straight into
            // a TextField with $fruitName. Typing here updates fruitsArr[index]
            // back in InputListView in real time no manual syncing needed.
            TextField("Fruit name", text: $fruitName)
                .textFieldStyle(.roundedBorder)
                .font(.title2)
                .padding(.horizontal)
        }
        .padding()
        .navigationTitle(fruitName)
    }
}

#Preview {
    // In a preview (or anywhere without a real parent @State), you can create
    // a temporary Binding with .constant(). It's read-only in practice
    // fine for previews, but never use .constant() for real app data.
    NavigationStack {
        DetailView(fruitName: .constant("Apples"))
    }
}
