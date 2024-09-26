import SwiftUI

struct SearchView: View {
    @EnvironmentObject var dataStore : DataStore
    @FocusState var isFocused: Bool
    @State var paddingBottom: CGFloat = 55
    @State var searchQuery = ""
    @State var showSearchbar = false
    @State var showButton = true
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white.opacity(0))
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .opacity(isFocused ? 1 : 0) // Conditionally set opacity
                        .animation(.easeInOut(duration: 0.1), value: isFocused) // Explicitly animate the change
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.keyboard)
                .ignoresSafeArea(.container)
                .onTapGesture{
                    withAnimation(.default) {
                        isFocused = false
                        showSearchbar = false
                        showButton = true
                        searchQuery = ""
                    }
                }
            VStack(alignment:.trailing) {
                Spacer()
                if showButton {
                    Button {
                        withAnimation{
                            showSearchbar = true
                            isFocused = true
                            showButton = false
                        }
                        print(isFocused)
                    } label: {
                        Image(systemName: "magnifyingglass")
                        .padding(20)
                        .background(RoundedRectangle(cornerRadius: 100).fill(.purple.gradient))
                        .foregroundStyle(.white)
                    }
                    .padding(.horizontal)
                    .padding(.bottom,60)
                    .frame(maxWidth:.infinity,alignment: .trailing)
                }
                if showSearchbar {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 0))
                        TextField("Start searching...", text: $searchQuery)
                            .focused($isFocused)
                            .onChange(of: isFocused) {
                                withAnimation(.default) {
                                    //paddingBottom = isFocused ? 10 : 55
                                    paddingBottom = 10
                                    if showSearchbar == true && isFocused == false {
                                        showSearchbar = false
                                        showButton = true
                                    }
                                    
                                }
                            }
                        Spacer()
                    }
                    .frame(maxWidth:500)
                    .background(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/),lineWidth: 2)
                            .background(RoundedRectangle(cornerRadius: 25).fill(.background.opacity(0.9)))
                    )
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: paddingBottom, trailing: 15))
                    .onTapGesture {
                        isFocused = true
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    SearchView()
}
