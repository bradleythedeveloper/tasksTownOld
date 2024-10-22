//
//  AddItemView.swift
//  tasksTown
//
//  Created by Bradley Austin on 02/10/2024.
//

import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var dataStore: DataStore
    @Environment(\.dismiss) var dismiss
    @State var isFocused: Bool = true
    @State var paddingBottom: CGFloat = 55
    @State var showAddView = false
    @State var itemType: ItemType = .task
    @State var currentDisclosureGroup: DisclosureGroupType?
    @State var name: String = ""
    @State var description: String = ""
    @State var date: Date = Date()
    @State var dateType: ItemDateType = .due
    @State var color: ItemColor = .none
    @State var tag: Tag?
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Picker("", selection: $itemType) {
                        ForEach(ItemType.allCases) { itemType in
                            Text(itemType.name).tag(itemType)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("What do you want to do?", text: $name, axis: .vertical)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                    TextField("Add a description", text: $description, axis: .vertical)
                        //.font(.)
                    
                    Divider()
                    
                    DisclosureGroup {
                        VStack {
                            Picker("", selection: $dateType) {
                                ForEach(ItemDateType.allCases) { dateType in
                                    Text(dateType.rawValue).tag(dateType)
                                }
                            }
                            .pickerStyle(.segmented)
                            .padding(.top)
                            if dateType != .noDate {
                                DatePicker("Select a date",selection: $date)
                                    .labelsHidden()
                                    .datePickerStyle(.graphical)
                                    //.transition(.slide)
                            }
                        }
                    } label: {
                        AddOptionDisclosureGroupLabel(
                            name: "Date",
                            icon: "calendar",
                            color: .purple,
                            caption: "\(dateType == .noDate ? "No Date" : "\(dateType.rawValue) \(date.formatted(date: .abbreviated, time: .shortened))")"
                        )
                    }
                    
                    HStack {
                        AddOptionDisclosureGroupLabel(
                            name: "Colour",
                            icon: color.icon,
                            color: color.color,
                            caption: "\(color.name)"
                        )
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
                    
                    HStack {
                        AddOptionDisclosureGroupLabel(
                            name: "Tag",
                            icon: "tag.fill",
                            color: .mint,
                            caption: "\(color.name)"
                        )
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

//                    Button {
//                        currentDisclosureGroup = .tag
//                    } label: {
//                        Label("Tag", systemImage: "tag.fill")
//                    }
//                    .popover(isPresented: Binding(
//                        get: { currentDisclosureGroup == .tag },
//                        set: { if $0 { currentDisclosureGroup = .tag } else { currentDisclosureGroup = nil } }
//                    ),
//                             attachmentAnchor: .point(.top),
//                             arrowEdge: .bottom
//                    ) {
//                        VStack {
//                        }
//                        .presentationCompactAdaptation(.popover)
//                    }
//                    .frame(maxWidth: .infinity,alignment: .leading)
                    
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
                .padding(.horizontal)
            }
            .navigationTitle("Add to Journal")
            .toolbar {
                ToolbarItem(placement:.cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement:.confirmationAction) {
                    Button("Done") {
                        print("Pressed")
                    }
                }
            }
        }
    }
}

#Preview {
    AddItemView()
}

struct AddOptionDisclosureGroupLabel: View {
    var name: String
    var icon: String
    var color: Color
    //@Binding
    var caption: String
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 40,height: 40)
                .foregroundStyle(color.gradient)
                .overlay {
                    Image(systemName: icon)
                        .foregroundStyle(.white)
                        .font(.title2)
                }
            VStack(alignment:.leading, spacing: 0) {
                Text(name)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(caption)
                    .font(.subheadline)
            }
        }
        .foregroundStyle(.foreground)
    }
}
