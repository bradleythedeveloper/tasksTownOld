//
//  YouView.swift
//  tasksTown
//
//  Created by Bradley Austin on 25/09/2024.
//

import SwiftUI

struct YouView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack(spacing: 15) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                        VStack(alignment: .leading) {
                            Text("Person")
                                .font(.headline)
                            Text("person@email.com")
                                .font(.subheadline)
                        }
                    }
                    .padding(.vertical,5)
                }
                
                Section("Statistics") {
                    VStack {
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("Level 100")
                            Spacer()
                            Text("10 / 100 XP")
                        }
                        ProgressView(value: 10, total: 100)
                            .progressViewStyle(.linear)
                            //.padding(.top,-10)
                    }
                    .padding(.vertical,5)
                    
                    HStack {
                        Image(systemName: "flame.fill")
                        Text("100 day Productivity Streak")
                        Spacer()
                    }
                }
                
                Section("Friends") {
                    ForEach(1..<5) { friend in
                        NavigationLink(destination: {}) {
                            HStack {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                Text("Friend \(friend)")
                            }
                        }
                    }
                    NavigationLink(destination: {}) {
                        HStack {
                            
                            Text("View All Friends")
                                .foregroundStyle(.primary)
                        }
                    }
                    
                }
                
                Section("Settings") {
                    NavigationLink(destination: ConnectAccountsView) {
                        HStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 30,height: 30)
                                .foregroundStyle(.red.gradient)
                                .overlay {
                                    Image(systemName: "link")
                                        .foregroundStyle(.white)
                                }
                            Text("Connect Accounts")
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("You")
        }
    }
    var ConnectAccountsView: some View {
        NavigationStack {
            ScrollView {
                
            }
            .navigationTitle("Connect Accounts")
        }
    }
}

#Preview {
    YouView()
}
