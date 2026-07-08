//
//  ContentView.swift
//  List Down
//
//  Created by Jaimin Raval on 06/07/26.
//

import SwiftUI

struct BasicListView: View {
    @State private var fruitsArr: [String] = [
        "Apples",
        "Oranges",
        "Coconut",
        "Raspberry",
        "Pomegranate",
        "Banana",
        "Coldwater",
        "Blueberry",
        "",
        "",
        "",
    ]
    var body: some View {
        NavigationStack {
            List {
                ForEach(fruitsArr, id: \.self) { fruit in
                    Text(fruit)
                }
                .onDelete(perform: swipeToDelete)
            }
            .navigationTitle("Fruits")
        }
    }
    private func swipeToDelete(at offset: IndexSet) {
        fruitsArr.remove(atOffsets: offset)
        //        print(fruitsArr)  //  uncomment this to see changes in our 'fruitArr' array
    }
}



#Preview {
    BasicListView()
}
