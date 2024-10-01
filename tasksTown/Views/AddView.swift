//
//  AddView.swift
//  tasksTown
//
//  Created by Bradley Austin on 27/09/2024.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var dataStore: DataStore
    @State var isFocused: Bool = true
    @State var paddingBottom: CGFloat = 55
    @State var showAddView = false
    @State var itemType: ItemType = .task
    @State var currentDisclosureGroup: DisclosureGroupType?
    @State var name: String = ""
    @State var date: Date = Date()
    @State var dateType: ItemDateType = .due
    @State var color: ItemColor = .none
    
    var body: some View {
        ZStack {
            if showAddView {
                Rectangle()
                    .foregroundStyle(.white.opacity(0.1))
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .opacity(isFocused ? 1 : 0)
                            .animation(.easeInOut(duration: 0.1), value: isFocused)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(.keyboard)
                    .ignoresSafeArea(.container)
                    .onTapGesture {
                        withAnimation {
                            showAddView = false
                        }
                    }
            
                VStack(spacing: 15) {
                    Spacer()
                    Picker("", selection: $itemType) {
                        ForEach(ItemType.allCases) { itemType in
                            Text(itemType.name).tag(itemType)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    VStack (spacing: 10) {
                        TextField("What do you want to do?", text: $name, axis: .vertical)
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Picker("", selection: $dateType) {
                            ForEach(ItemDateType.allCases) { dateType in
                                Text(dateType.rawValue).tag(dateType)
                            }
                        }
                        .pickerStyle(.segmented)
                        
                        HStack {
                            DatePicker("Select a date",selection: $date)
                                .labelsHidden()
                            Spacer()
                        }
                        
                        HStack {
                            Label("Colour", systemImage: "tag.fill")
                            Spacer()
                            Picker("", selection: $color) {
                                ForEach(ItemColor.allCases) { color in
                                    HStack {
                                        //Image(systemName: color.icon)
                                        Text(color.name)
                                    }
                                    .tag(color)
                                }
                            }
                            .pickerStyle(.menu)
                            .padding(.trailing,-10)
                        }

                        Button {
                            currentDisclosureGroup = .tag
                        } label: {
                            Label("Tag", systemImage: "tag.fill")
                        }
                        .popover(isPresented: Binding(
                            get: { currentDisclosureGroup == .tag },
                            set: { if $0 { currentDisclosureGroup = .tag } else { currentDisclosureGroup = nil } }
                        ),
                                 attachmentAnchor: .point(.top),
                                 arrowEdge: .bottom
                        ) {
                            VStack {
                            }
                            .presentationCompactAdaptation(.popover)
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        
//                        DisclosureGroup(isExpanded: Binding(
//                            get: { currentDisclosureGroup == .tag },
//                            set: { if $0 { currentDisclosureGroup = .tag } else { currentDisclosureGroup = nil } }
//                        )) {
//                            // Tag content goes here
//                        } label: {
//                            Label("Tag", systemImage: "tag.fill")
//                        }
//                        .foregroundStyle(.foreground)
                        
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.windowBackground)
                            .shadow(radius: 2)
                    )
                }
                .padding()
                .transition(.move(edge: .bottom))

            } else {
                VStack {
                    Spacer()
                    Button {
                        withAnimation {
                            showAddView = true
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
    }
}

enum ItemType: String, Identifiable, CaseIterable {
    case task
    case event
    case image
    case link
    case habit
    var id: Self { self }
    var name: String { rawValue.localizedCapitalized }
}

enum DisclosureGroupType {
    case date, tag, color
}

#Preview {
    AddView(showAddView: true)
}
