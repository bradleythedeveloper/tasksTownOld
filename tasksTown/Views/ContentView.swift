//
//  ContentView.swift
//  tasksTown
//
//  Created by Bradley Austin on 25/09/2024.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//        TabView {
//            Text("Hello, world!")
//                .tabItem {
//                    Label("Dashboard", systemImage: "globe")
//                }
//        }
//        NavigationSplitView {
//            
//        } content: {
//            
//        } detail: {
//            
//        }
//    }
//}

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var dataStore: DataStore
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    @State private var isSmallScreen: Bool = false
    @State var selectedView: AppSection? = .dashboard
    @State var selectedTabView: AppSection = .dashboard
    
    var tabViewStyle: some TabViewStyle {
        if #available(iOS 18.0, macOS 15.0, *) {
            return .sidebarAdaptable
        } else {
            return .automatic
        }
    }
    
    var body: some View {
        ZStack {
            if #available(iOS 18.0, macOS 15.0, *) {
                TabView(selection:$selectedTabView) {
                    ForEach(AppSection.allCases) { view in
                        AnyView(view.tabView)
                            .tabItem {
                                Label(view.name, systemImage: view.icon)
                            }
                            .tag(view)
                    }
                }
                .tabViewStyle(tabViewStyle)
                .tabViewSidebarHeader {
                    Text("tasksTown")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
//                .onAppear {
//                    selectedView = selectedTabView
//                    print(selectedView as Any)
//                }
//                .onChange(of: selectedTabView) {
//                    selectedView = selectedTabView
//                    print(selectedView as Any)
//                }
            } else {
                NavigationSplitView(columnVisibility:$columnVisibility) {
                    List(selection:$selectedView) {
                        ForEach(AppSection.allCases) { view in
                            NavigationLink {
                                switch selectedView {
                                case .dashboard:
                                    if horizontalSizeClass == .compact {
                                        DashboardView()
                                    } else {
                                        DashboardSidebarView()
                                    }
                                case .journal:
                                    JournalView()
                                case .focus:
                                    FocusView()
                                case .town:
                                    //TownView()
                                    TownSidebarView()
                                case .you:
                                    YouView()
                                default:
                                    Text("no view")
                                }
                            } label: {
                                HStack {
                                    Image(systemName: view.icon)
                                        .frame(width:15)
                                    Text(view.name)
                                }
                            }
                            .tag(view)
                        }
                    }
                    .navigationTitle("TasksTown")
                } content: {
                    switch selectedView {
                    case .dashboard:
                        DashboardSidebarView()
                    case .town:
                        TownSidebarView()
                    default:
                        Text("No view")
                    }
                } detail: {
                    switch selectedView {
                    case .dashboard, nil:
                        DashboardView()
                        #if os(iOS)
                            .toolbar(.hidden, for: .navigationBar)
                        #endif
                            .padding(.vertical,10)
                    case .town:
                        TownView()
                        #if os(iOS)
                            .toolbar(.hidden, for: .navigationBar)
                        #endif
                    default:
                        Text("No view")
                        Button("Test") {
                            selectedView = .dashboard
                        }
                    }
                }
                .onAppear {
                    if let selectedView = selectedView {
                        selectedTabView = selectedView
                    }
                    print(selectedView as Any)
                }
                /*.onChange(of: horizontalSizeClass) {
                    print("Screen size changed: \(horizontalSizeClass)")
                }*/
                .onChange(of: selectedView) {
                    if let selectedView = selectedView {
                        selectedTabView = selectedView
                        print(selectedView as Any)
                        print(selectedTabView)
                    }
                }
            }
            //SearchView()
            AddView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(DataStore())
}
