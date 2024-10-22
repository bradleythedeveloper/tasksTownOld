//
//  AddItemButton.swift
//  tasksTown
//
//  Created by Bradley Austin on 03/10/2024.
//

import SwiftUI

struct AddItemButton: View {
    @Binding var showAddItemSheet: Bool
    var body: some View {
        VStack {
            Spacer()
            Button {
                withAnimation {
                    showAddItemSheet = true
                }
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add")
                }
                .padding()
                .background(Capsule().fill(.purple.gradient))
                .foregroundStyle(.white)
            }
            .padding(.horizontal)
            .padding(.bottom, 60)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

//#Preview {
//    @Previewable @State var showAddItemSheet: Bool = false
//    AddItemButton(showAddItemSheet: $showAddItemSheet)
//}
