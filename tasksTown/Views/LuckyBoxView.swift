//
//  LuckyBoxView.swift
//  tasksTown
//
//  Created by Bradley Austin on 11/10/2024.
//

import SwiftUI

//struct LuckyBoxView: View {
//    @State var isOpen: Bool = false
//    var body: some View {
//        VStack(spacing: 10) {
//            if !isOpen {
//                RoundedRectangle(cornerRadius: 5)
//                    .fill(.red.gradient)
//                    .frame(width: 300, height: 300)
//                    .overlay {
//                        Image(systemName: "questionmark")
//                            .font(.system(size: 100))
//                            .foregroundStyle(.white)
//                    }
//                    //.transition(.move(edge: .bottom))
//                    .transition(.scale(scale: 500))
//                Text("A Lucky Box just for you")
//                Text("Tap to open")
//                    .font(.caption)
//            }
//            Button("Open") {
//                withAnimation {
//                    isOpen.toggle()
//                }
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .onTapGesture {
//            withAnimation {
//                isOpen = true
//            }
//        }
//    }
//}

struct LuckyBoxView: View {
    @State private var isOpened = false
    @State private var showReward = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing:0) {
            Spacer()
            if showReward {
                VStack {
                    Text("🎉 Reward!")
                        .font(.largeTitle)
                    Button("Claim") {
                        
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.bottom, 200)
                .transition(.scale.combined(with: .move(edge: .bottom)))
            } else {
                VStack {
                    Text("A Lucky Box for all your hard work!")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Text("Tap to open")
                        .font(.caption)
                    Image(systemName: "arrow.down")
                        .font(.title)
                        .offset(y: 10)
                }
                .padding(.bottom, 200)
                .transition(.opacity)
            }
            VStack(spacing:0){
                HStack(spacing:0) {
                    Circle()
                        .stroke(Color.red, lineWidth: 7)
                        .frame(width: 50, height: 50)
                    Circle()
                        .stroke(Color.red, lineWidth: 7)
                        .frame(width: 50, height: 50)
                }
                .offset(y:20)
                
                ZStack{
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 170, height: 30)
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 10, height: 30)
                }
            }
            .rotationEffect(.degrees(isOpened ? -120 : 0), anchor: .bottomLeading)
            .animation(.easeInOut(duration: 0.6), value: isOpened)
            ZStack {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 150, height: 150)
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 10, height: 150)
            }
        }
        .onTapGesture {
            if !isOpened {
                isOpened = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation {
                        showReward = true // Show reward after lid finishes opening
                    }
                }
            }
        }
    }
    
    func claimLuckyBox() {
        dismiss()
    }
}

#Preview {
    LuckyBoxView()
}
