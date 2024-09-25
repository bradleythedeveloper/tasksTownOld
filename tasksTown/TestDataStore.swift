import SwiftUI

class DataStore: ObservableObject {
    @Published var tasks = [
        Task(name: "Test Task"),
        Task(name: "Test Task 2", dueDate: Date(), dateType: .due, color: .red),
        Task(name: "Test Task 3"),
        Task(name: "Test Task 4"),
        Task(name: "Test Task 5"),
        Task(name: "Test Task 6"),
        Task(name: "Test Task 7"),
        Task(name: "Test Task 8"),
    ]
    @Published var tags = [
        Tag(name: "School"),
        Tag(name: "Personal"),
        Tag(name: "Family"),
        //Tag(name: "Work"),
    ]
    //@Published var showSearchbar = true
    //@Published var currentTab: CGFloat
}

// MARK: AppViews

struct AppView: Identifiable, Hashable {
    let contentView: AnyView
    let detailView: AnyView
    let name: String
    let icon: String
    let id = UUID()
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    static func ==(lhs: AppView, rhs: AppView) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: Task classes/enums

class Task: Identifiable, Hashable {
    var name: String
    var dueDate: Date?
    var id = UUID().uuidString
    var isComplete = false
    var isFocused = false
    var dateType: TaskDateType
    var dateTypePrint = ""
    var color: TaskColor
    var tag: Tag?
    init(name:String,dueDate:Date,dateType:TaskDateType,color:TaskColor = .none) {
        self.name = name
        self.dueDate = dueDate
        self.dateType = dateType
        self.color = color
    }
    init(name:String,taskColour:TaskColor = .none) {
        self.name = name
        self.dateType = .noDate
        self.dateTypePrint = "No Date"
        self.color = taskColour
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    static func ==(lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
}

enum TaskDateType: String {
    case due = "Due"
    case completeBy = "Complete By"
    case noDate = "No Date"
}
enum TaskColor: String, CaseIterable, Identifiable {
    case red
    case yellow
    case green
    case none
    var id: Self { self }
    var name: String { rawValue.localizedCapitalized }
    var color: Color {
        switch self {
        case .red:
            return .red
        case .yellow:
            return .yellow
        case .green:
            return .green
        default:
            return .gray
        }
    }
    var icon: String {
            switch self {
            case .red:
                return "exclamationmark.3"
            case .yellow:
                return "exclamationmark.2"
            case .green:
                return "exclamationmark"
            default:
                return "nosign"
            }
        }
}

// MARK: Tag

class Tag: Identifiable, Hashable {
    var name: String
    var id: String
    var color: Color
    var isEditing = false
    init(name: String, id: String = UUID().uuidString, color: Color = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))) {
        self.name = name
        self.id = id
        self.color = color
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    static func == (lhs: Tag, rhs: Tag) -> Bool {
        return lhs.id == rhs.id
    }
}

// Library classes

class LibraryPhoto {
    var name: String?
    var id: String?
    var image: Image?
    var tags: [Tag]?
}
