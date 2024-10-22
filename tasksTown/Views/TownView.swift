//
//  TownView.swift
//  tasksTown
//
//  Created by Bradley Austin on 25/09/2024.
//

import SwiftUI

struct TownView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                ZStack {
                    //NightBackgroundView()
                    DayBackgroundView()
                    VStack {
                        HStack(alignment: .bottom) {
                            VStack(spacing:30) {
                                VStack(alignment: .leading) {
                                    Text("My House")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    Text("5 red tasks, 4 yellow tasks")
                                    Button("Visit") {
                                        
                                    }
                                    .buttonStyle(.borderedProminent)
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white)
                                        .stroke(.black, lineWidth: 3)
                                )
                                Image("myhouse_result")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 350, height: 350)
                                
                            }
                            .zIndex(99)
                            .padding(-15)
                            VStack(spacing:30) {
                                VStack(alignment: .leading) {
                                    Label("Music Store", systemImage: "music.note")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    HStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.purple)
                                            .frame(width: 100, height: 100)
                                            .overlay {
                                                Image(systemName: "music.note")
                                                    .foregroundStyle(.white)
                                            }
                                        VStack {
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
                                            .buttonStyle(.plain)
                                        }
                                    }
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white)
                                        .stroke(.black, lineWidth: 3)
                                )
                                .offset(x:-15,y:15)
                                Image("music_store_v2_result")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 350)
                            }
                            .padding(-15)
                            .offset(x:-15)
                            Spacer()
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        LinearGradient(gradient: Gradient(colors: [Color.green, Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                            .frame(minWidth: 1500, maxWidth: .infinity, maxHeight: 100)
                            .ignoresSafeArea()
                    }
                    .frame(maxWidth: .infinity)
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .ignoresSafeArea()
            //.navigationTitle("Town")
            //.clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                VStack {
                    HStack {
                        Image(systemName: "banknote.fill")
                        Text("$100")
                    }
                    .padding()
                    .padding(.vertical,-5)
                    .foregroundStyle(.white)
                    .background(Capsule().fill(Color.orange.gradient))
                    Spacer()
                }
                    .frame(maxWidth: .infinity,alignment: .trailing)
                    .padding()
                
            )
            //.padding(15)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

// Custom view modifier to conditionally apply modifiers
extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

#Preview {
    TownView()
}

struct NightBackgroundView: View {
    let numberOfStars = 100
    let stars: [(xPosition: CGFloat, yPosition: CGFloat, starSize: CGFloat, brightness: Double)] = {
        var stars = [(CGFloat, CGFloat, CGFloat, Double)]()
        for _ in 0..<100 {
            let xPosition = CGFloat.random(in: 0...1000)
            let yPosition = CGFloat.random(in: 0...700)
            let starSize = CGFloat.random(in: 1...3)
            let brightness = Double.random(in: 0.5...1)
            stars.append((xPosition, yPosition, starSize, brightness))
        }
        return stars
    }()
    var body: some View {
        ZStack {
            Color.black
            Canvas { context, size in
                for star in stars {
                    context.fill(
                        Circle()
                            .path(in: CGRect(x: star.xPosition, y: star.yPosition, width: star.starSize, height: star.starSize)),
                        with: .color(Color.white.opacity(star.brightness))
                    )
                }
            }
        }
        //.ignoresSafeArea()
    }
}

struct DayBackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue,.white], startPoint: .top, endPoint: .bottom)
            ForEach(1..<10) { num in
                CloudView()
                    .offset(x:CGFloat.random(in: -500...500), y:CGFloat.random(in: -300...0))
            }
        }
    }
}

struct CloudView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 90, height: 90)
                .offset(x: -50, y: 20)
            Circle()
                .fill(Color.white)
                .frame(width: 120, height: 120)
                .offset(x: 0, y: 10)
            Circle()
                .fill(Color.white)
                .frame(width: 80, height: 80)
                .offset(x: 50, y: 20)
        }
        //.opacity(0.8)
    }
}
