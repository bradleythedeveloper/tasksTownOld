import SwiftUI

struct JournalView: View {
    @EnvironmentObject var dataStore: DataStore
    @FocusState private var focusedTaskID: String?
    @State private var searchQuery: String = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // MARK: TagSelectorView
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach($dataStore.tags, id: \.id) { tag in
                                Button {
                                    tag.isEditing.wrappedValue.toggle()
                                } label: {
                                    Text("\(tag.name.wrappedValue)")
                                        .foregroundStyle(.white)
                                        .padding()
                                        .padding(.vertical,-5)
                                        .background(
                                            Capsule()
                                                .fill(tag.color.wrappedValue.gradient)
                                        )
                                    
                                }
                                .popover(isPresented: tag.isEditing,
                                         //attachmentAnchor: .point(.bottom),
                                         //arrowEdge: .trailing,
                                         content: {
                                    VStack {
                                        TextField("Enter a name", text: tag.name, axis: .horizontal)
                                            .font(.title)
                                            .fontWeight(.bold)
                                        Text("Tap to edit name")
                                            .font(.caption)
                                            .frame(maxWidth:.infinity,alignment: .leading)
                                            .padding(.top,-10)
                                        ColorPicker("Tag Colour", selection: tag.color)
                                        Button("Delete Task", role: .destructive) {
                                            if let index = dataStore.tags.firstIndex(of: tag.wrappedValue) {
                                                dataStore.tags.remove(at: index)
                                            }
                                        }
                                        .frame(maxWidth:.infinity,alignment: .leading)
                                    }
                                    .padding()
                                    .frame(maxWidth:.infinity,alignment: .leading)
                                    .presentationCompactAdaptation(.popover)
                                })
                            }
                            Button {
                                
                            } label: {
                                Label("Add Tag",systemImage: "plus")
                                    .foregroundStyle(.white)
                                    .padding()
                                    .padding(.vertical,-5)
                                    .background(
                                        Capsule()
                                            .fill(.blue.gradient)
                                    )
                            }
                            .popover(isPresented: .constant(false), content: {
                                VStack {
                                    //                                    TextField("Enter a name", text: tag.name, axis: .horizontal)
                                    //                                        .font(.title)
                                    //                                        .fontWeight(.bold)
                                    //                                    Text("Tap to edit name")
                                    //                                        .font(.caption)
                                    //                                        .frame(maxWidth:.infinity,alignment: .leading)
                                    //                                        .padding(.top,-10)
                                    //                                    ColorPicker("Tag Colour", selection: tag.color)
                                    //                                    Button("Delete Task", role: .destructive) {
                                    //                                        if let index = dataStore.tags.firstIndex(of: tag.wrappedValue) {
                                    //                                            dataStore.tags.remove(at: index)
                                    //                                        }
                                    //                                    }
                                    //                                    .frame(maxWidth:.infinity,alignment: .leading)
                                }
                                .padding()
                                .frame(maxWidth:.infinity,alignment: .leading)
                                .presentationCompactAdaptation(.popover)
                            })
                        }
                        .frame(maxWidth: .infinity, alignment:.leading)
                        .padding(.bottom)
                        .padding(.horizontal)
                    }
                    .scrollIndicators(.never)
                    // MARK: Main View
                    Group {
                        Text("Tasks & Events")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth:.infinity,alignment: .leading)
                        HStack {
                            Text("For Today")
                            Button("Show All Tasks & Events") {
                                
                            }
                            Spacer()
                        }
                        ForEach($dataStore.tasks) { task in
                            HStack(spacing:5) {
                                Toggle(isOn: task.isComplete) {
                                    Image(systemName: "circle")
                                }
                                .toggleStyle(CheckboxToggleStyle())
                                .padding(0)
                                VStack(alignment:.leading,spacing: 2) {
                                    TextField("Enter a task", text: task.name)
                                        .focused($focusedTaskID, equals: task.id)
                                        .onChange(of: focusedTaskID) {
                                            //let isFocused = focusedTaskID == task.id
                                            //let showDate = isFocused
                                        }
                                        .padding(.trailing,5)
                                    Menu {
                                        Menu("Due On") {
                                            Button("Test"){
                                                
                                            }
                                        }
                                    } label: {
                                        HStack(spacing:4) {
                                            Image(systemName: "calendar")
                                            //Text("\(task.dateTypePrint.wrappedValue) \(task.dueDate.wrappedValue == nil ? "" : "\(task.dueDate.wrappedValue!)")")
                                            Text(formattedDueDate(task))
                                                .onAppear{
                                                    task.dateTypePrint.wrappedValue = createDateTypePrint(task: task)
                                                }
                                                .onChange(of: task.dueDate.wrappedValue) {
                                                    task.dateTypePrint.wrappedValue = createDateTypePrint(task: task)
                                                }
                                        }
                                    }
                                }
                                Spacer()
                                Menu {
                                    ForEach(ItemColor.allCases) { color in
                                        Button {
                                            task.color.wrappedValue = color
                                        } label: {
                                            HStack {
                                                Label(color.name, systemImage: color.icon)
                                                //Image(systemName: "circle.fill").foregroundStyle(color.color)
                                            }
                                        }
                                    }
                                    
                                } label: {
                                    HStack {
                                        //Image(systemName: "paintpalette.fill")
                                        Image(systemName: task.wrappedValue.color.icon)
                                        Text("\(task.color.wrappedValue.rawValue.localizedCapitalized)")
                                    }
                                    .foregroundStyle(Color.white)
                                    .padding()
                                    .padding(.vertical,-5)
                                    .background(
                                        Capsule()
                                            .fill(task.color.wrappedValue.color.gradient.opacity(0.7))
                                    )
                                }
                            }
                        }
                        Text("Library")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth:.infinity,alignment: .leading)
                        HStack {
                            Text("For Today")
                            Button("Show All Items in Library") {
                                
                            }
                            Spacer()
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Website 1")
                                    .font(.headline)
                                Text("Website1.com")
                            }
                            Spacer()
                            Button {
                                
                            } label: {
                                Image(systemName: "safari")
                            }
                            .foregroundStyle(.white)
                        }
                        .frame(maxWidth:.infinity,alignment: .leading)
                        .foregroundStyle(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.gradient)
                        )
                        RoundedRectangle(cornerRadius: 10)
                            //.frame(width: .infinity, height: 200)
                            .foregroundStyle(.gray)
                            .overlay(
                                Text("Picture")
                            )
                        RoundedRectangle(cornerRadius: 10)
                            //.frame(width: .infinity, height: 200)
                            .foregroundStyle(.gray)
                            .overlay(
                                ZStack {
                                    Text("Video")
                                    RoundedRectangle(cornerRadius: 10)
                                        //.frame(width: .infinity, height: 200)
                                        .foregroundStyle(
                                            LinearGradient(stops: [
                                                Gradient.Stop(color: .clear, location: 0.65),
                                                Gradient.Stop(color: .black.opacity(0.5), location: 0.95),
                                            ], startPoint: .top, endPoint: .bottom)
                                        )
                                    VStack(alignment:.leading) {
                                        Spacer()
                                        HStack {
                                            Text("Video 1")
                                                .font(.headline)
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Image(systemName: "play.fill")
                                        }
                                        .foregroundStyle(.white)
                                    }
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .padding()
                                }
                            )
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Journal")
        }
//        .searchable(text: $searchQuery) {
//            NavigationLink {
//                Text("Hello")
//            } label: {
//                Text("Hello")
//            }
//
//        }
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(configuration.isOn ? .primary : .primary)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(.plain)
    }
}

func createDateTypePrint(task:Binding<Task>) -> String {
    return task.dueDate.wrappedValue == nil ? "No Date" : task.dateType.wrappedValue.rawValue
}

func formattedDueDate(_ task: Binding<Task>) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    if let dueDate = task.wrappedValue.dueDate {
        return "Due \(formatter.string(from: dueDate))"
    } else {
        return "No Date"
    }
}

#Preview {
    JournalView()
        .environmentObject(DataStore())
}
