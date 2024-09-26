import SwiftUI

struct DashboardSidebarView: View {
    var body: some View {
        VStack(alignment:.leading,spacing: 20){
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 70 ,height: 70)
                .padding(.bottom,-10)
            Text("Welcome back, Bradley")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Image(systemName: "heart.fill")
                Text("Level 100")
                Spacer()
                Text("10 / 100 XP")
            }
            ProgressView(value: 10, total: 100)
                .progressViewStyle(.linear)
                .padding(.top,-10)
            Label("100 Day Productvity Score", systemImage: "flame.fill")
            Spacer()
        }
        .navigationTitle("Dashboard")
        .frame(maxWidth:.infinity,alignment: .leading)
        .padding(20)
    }
}

#Preview {
    DashboardSidebarView()
}
