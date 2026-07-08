//
//  InputListView.swift
//  List Down
//
//  Created by Jaimin Raval on 07/07/26.
//

import SwiftUI

struct InputListView: View {
    
    @State private var fruitsArr: [String] = [
        "Apples",
        "Oranges",
        "Coconut",
        "Raspberry",
        "Pomegranate",
        "Banana",
        "Coldwater",
        "Blueberry",
    ]
    
    @State private var inputText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(fruitsArr, id: \.self) { fruit in
                        Text(fruit)
                    }
                    .onDelete(perform: swipeToDelete)
                }
                .navigationTitle("Fruits")
                TextField("Eg: Orange", text: $inputText)
                    .onSubmit {
                        if !inputText.isEmpty {
                            fruitsArr.append(inputText)
                            print(fruitsArr)
                            inputText = ""
                        }
                    }
            }
        }
    }
    private func swipeToDelete(at offset: IndexSet) {
        fruitsArr.remove(atOffsets: offset)
        //        print(fruitsArr)  //  uncomment this to see changes in our 'fruitArr' array
    }
}

#Preview {
    InputListView()
}
