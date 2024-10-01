//
//  InAppWidget.swift
//  tasksTown
//
//  Created by Bradley Austin on 25/09/2024.
//

import SwiftUI

struct TimeInAppWidget: View {
    var body: some View {
        GroupBox {
            TimelineView(.periodic(
                from: .now,
                by: 1.0
            )) { context in
                Text("\(context.date.formatted(date: .long, time: .shortened))")
                    .font(.title2)
            }
        } label: {
            Label("Time", systemImage: "clock")
                .foregroundStyle(.primary)
        }
        .groupBoxStyle(InAppWidgetGroupBoxStyle())
    }
}

struct TasksInAppWidget: View {
    @EnvironmentObject var dataStore: DataStore
    var body: some View {
        GroupBox {
            LazyVGrid(columns:[GridItem(.flexible())], alignment:.leading,spacing: 5) {
                ForEach($dataStore.tasks.prefix(5)) {task in
                    HStack {
                        Toggle(isOn: task.isComplete) {
                            //Image(systemName: task.isComplete.wrappedValue ? "checkmark.circle.fill" : "circle")
                        }
                        .toggleStyle(CheckboxToggleStyle())
                        .foregroundStyle(.primary)
                        .padding(EdgeInsets(top: 0, leading: -1, bottom: 0, trailing: -2))
                        Text("\(task.name.wrappedValue)")
                        Spacer()
                        HStack {
                            //Image(systemName: "paintpalette.fill")
                            Image(systemName: task.wrappedValue.color.icon)
                            Text("\(task.color.wrappedValue.rawValue.localizedCapitalized)")
                        }
                        .foregroundStyle(task.color.wrappedValue.color.gradient)
                    }
                }
                //.padding(.vertical,5)
                Spacer()
                VStack(alignment:.leading, spacing: 5) {
                    Button("Add Task", systemImage: "plus") {}
                        .foregroundStyle(.white)
                        .buttonStyle(.borderedProminent)
                    Button("Go to Journal", systemImage: "chevron.right") {}
                        .foregroundStyle(.white)
                        .buttonStyle(.borderedProminent)
                }
                
            }
        } label: {
            Label("Tasks", systemImage: "checklist")
                .foregroundStyle(.blue)
        }
        .groupBoxStyle(InAppWidgetGroupBoxStyle())
    }
}

struct SpotifyInAppWidget: View {
    var body: some View {
        GroupBox {
            VStack(spacing:10) {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Image(systemName: "music.note")
                                .foregroundStyle(.gray)
                        }
                    Spacer()
                    VStack(alignment:.trailing) {
                        Text("Song Title")
                            .font(.headline)
                        Text("by SongArtist")
                            .font(.subheadline)
                            .padding(.bottom, 10)
                        HStack {
                            Button("", systemImage: "backward.fill") {
                                
                            }
                            Button("", systemImage: "play.fill") {
                                
                            }
                            Button("", systemImage: "forward.fill") {
                                
                            }
                        }
                        .padding(.trailing,-5)
                        .buttonStyle(.plain)
                    }
                    .frame(alignment: .trailing)
                    .foregroundStyle(.primary)
                }
                    
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1..<4) { index in
                            VStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 70, height: 70)
                                    .overlay {
                                        Image(systemName: "music.note")
                                            .foregroundStyle(.gray)
                                    }
                                    .foregroundStyle(.white)
                                Text("Playlist \(index)")
                                    .fontWeight(.semibold)
                                    .font(.caption)
                            }
                            
                        }
                        Spacer()
                    }
                    .padding(.top)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } label: {
            Label("Spotify", systemImage: "music.note")
                .foregroundStyle(.green)
        }
        .groupBoxStyle(InAppWidgetGroupBoxStyle())
    }
}

//struct FocusInAppWidget: View {
//    @State var focusHours = 0
//    @State var focusMinutes = 0
//    @State var focusDuration = 0
//    var body: some View {
//        GroupBox {
//            HStack {
//                Picker("Hours", selection: $focusHours) {
//                    ForEach(0...23, id: \.self) { hour in
//                        Text("\(hour)")
//                    }
//                }
//                .pickerStyle(.inline)
//                Text("Hours")
//                Picker("Hours", selection: $focusMinutes) {
//                    ForEach(0...59, id: \.self) { hour in
//                        Text("\(hour)")
//                    }
//                }
//                .pickerStyle(.wheel)
//                Text("Minutes")
//            }
//            Text("Hello")
//        } label: {
//            Label("Focus", systemImage: "moon.fill")
//                .foregroundStyle(.purple)
//        }
//        .groupBoxStyle(InAppWidgetGroupBoxStyle())
//    }
//}

struct InAppWidgetGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .font(.headline)
            VStack {
                Spacer(minLength: 1)
                configuration.content
                Spacer(minLength: 1)
            }
            .safeAreaPadding()
            .frame(maxWidth: .infinity, alignment: .leading)
            //.background(Color.gray.gradient.opacity(0.4))
            .background(.ultraThickMaterial)
            .cornerRadius(10)
        }
        .safeAreaPadding(.vertical,5)
        .frame(maxWidth: .infinity, alignment: .leading)
        //.background(HierarchicalShapeStyle.quinary)
        .foregroundStyle(.primary)
    }
}

#Preview {
    LazyVGrid(columns: [GridItem(.flexible())]) {
        SpotifyInAppWidget()
            //.frame(width: 200, height: 300)
        TasksInAppWidget()
            .environmentObject(DataStore())
    }
    .padding()
}
