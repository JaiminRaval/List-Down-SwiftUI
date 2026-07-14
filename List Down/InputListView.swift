//
//  InputListView.swift
//  List Down
//
//  Created by Jaimin Raval on 07/07/26.
//

import SwiftUI

struct InputListView: View {
    //  Creating/accessing UserDefaults via @AppStorage
    @AppStorage("firstName") private var userName: String = "jaimin"
    // This is the SOURCE OF TRUTH for the fruits array.
    // @State means SwiftUI owns and watches this value here, in this view.
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
                    // We use indices here (instead of ForEach(fruitsArr, id: \.self))
                    // because to create a @Binding to a single array element,
                    // we need a way to point back at "fruitsArr[i]" specifically.
                    // You can't make a Binding out of a value handed to you by ForEach directly.
                    ForEach(fruitsArr.indices, id: \.self) { index in
                        NavigationLink {
                            // $fruitsArr[index] creates a Binding<String> that points
                            // directly at that element inside fruitsArr.
                            // Passing $fruitsArr[index] instead of fruitsArr[index]
                            // means DetailView can WRITE BACK to this exact array slot.
                            
                            
                            DetailView(fruitName: $fruitsArr[index])
                        } label: {
                            Text(fruitsArr[index])
                        }
                    }
                    .onDelete(perform: swipeToDelete)
                }
                .navigationTitle(userName.isEmpty ? "Fruits" : "Welcome \(userName)")
                
                TextField("Eg: Orange", text: $inputText)
                    .onSubmit {
                        if !inputText.isEmpty {
                            fruitsArr.append(inputText)
                            inputText = ""
                        }
                    }
            }
        }
    }
    
    private func swipeToDelete(at offset: IndexSet) {
        fruitsArr.remove(atOffsets: offset)
    }
}

#Preview {
    InputListView()
}
