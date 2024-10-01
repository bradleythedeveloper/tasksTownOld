//
//  TownSidebarView.swift
//  To-Do List
//
//  Created by Bradley Austin on 18/09/2024.
//

import SwiftUI

struct TownSidebarView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Messages for the Mayor")
                        .font(.title)
                        .bold()
                    ForEach(1..<10) { num in
                        VStack(alignment:.leading) {
                            HStack {
                                Image(systemName: "person.crop.circle")
                                Text("Person \(num)")
                            }
                            Text("Hello, how are you doing?")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .foregroundStyle(Color.white)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.gradient))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
            .navigationTitle("Town")
            .scrollIndicators(.never)
        }
    }
}

#Preview {
    TownSidebarView()
}
