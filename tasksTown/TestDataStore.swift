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

// MARK: Tag



// Library classes

class LibraryPhoto {
    var name: String?
    var id: String?
    var image: Image?
    var tags: [Tag]?
}
