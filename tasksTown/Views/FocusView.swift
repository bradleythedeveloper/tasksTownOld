//
//  FocusView.swift
//  tasksTown
//
//  Created by Bradley Austin on 25/09/2024.
//

import SwiftUI

struct FocusView: View {
    @State var focusHours = 0
    @State var focusMinutes = 0
    @State var focusDuration = 0
    @State var focusSessionActive = false
    @State var focusSessionType: FocusSessionType = .stopwatch
    @State var endDate: Date = Date.now.addingTimeInterval(100000000)
    @State var websiteBlockingActive = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing:20) {
                    //TestView
                    // MARK: MainFocusSelectView
                    if !focusSessionActive {
                        Picker("", selection: $focusSessionType) {
                            ForEach(FocusSessionType.allCases) { type in
                                Text(type.name).tag(type)
                            }
                        }
                        .pickerStyle(.segmented)
                        if focusSessionType == .timer {
                            HStack {
                                Picker("Hours", selection: $focusHours) {
                                    ForEach(0...23, id: \.self) { hour in
                                        Text("\(hour)")
                                    }
                                }
                                .pickerStyle(.inline)
                                Text("Hours")
                                Picker("Hours", selection: $focusMinutes) {
                                    ForEach(0...59, id: \.self) { hour in
                                        Text("\(hour)")
                                    }
                                }
                                .pickerStyle(.wheel)
                                Text("Minutes")
                            }
                            .padding(.trailing)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.primary.opacity(0.1))
                            )
                        } else if focusSessionType == .stopwatch {
                            Text("Stopwatch starts a session without a specific duration.")
                                .frame(maxWidth:.infinity,alignment: .leading)
                        }
                    } else {
                        Gauge(value: 0.5, in: 0...1) {
                            TimelineView(.periodic(
                                from: .now,
                                by: 1.0
                            )) { context in
                                let timeLeft = Calendar.current.dateComponents([.hour, .minute, .second], from: context.date, to: endDate)
                                HStack(alignment:.bottom) {
                                    if let hoursLeft = timeLeft.hour {
                                        Text("\(hoursLeft)")
                                            .font(.largeTitle)
                                        Text("hours")
                                            .padding(.bottom,3)
                                            .padding(.leading,-4)
                                    }
                                    if let minutesLeft = timeLeft.minute {
                                        Text("\(minutesLeft)")
                                            .font(.largeTitle)
                                        Text("minutes")
                                            .padding(.bottom,3)
                                            .padding(.leading,-4)
                                    }
                                    if let secondsLeft = timeLeft.second {
                                        Text("\(secondsLeft)")
                                            .font(.largeTitle)
                                        Text("seconds")
                                            .padding(.bottom,3)
                                            .padding(.leading,-4)
                                    }
                                }
                            }
                            .frame(maxWidth:.infinity,alignment: .leading)
                            .padding(.bottom,-3)
                        }
                        //Spacer()
                    }
                    Button {
                        withAnimation {
                            if !focusSessionActive {
                                focusSessionActive = true
                                endDate = Calendar.current.date(byAdding: .hour, value: 60, to: .now)!
                            } else {
                                focusSessionActive = false
                            }
                        }
                    } label: {
                        Text(!focusSessionActive ? "Start Focus" : "End Focus")
                            .transition(.slide)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.accentColor)
                            )
                    }
                    // MARK: FocusConfigurationView
                    if !focusSessionActive {
                        VStack(alignment:.leading) {
                            Toggle("Website Blocking", isOn: $websiteBlockingActive)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .allowsTightening(true)
                        }
                        .padding()
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.primary.opacity(0.1))
                        )
                        // Presets
                        Text("Presets")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.bottom,-14)
                        VStack(alignment:.leading) {
                            Text("Study")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Label("30 Minutes", systemImage: "clock")
                            Label("10 Apps & Websites Blocked", systemImage: "hand.raised.fill")
                            Label("4 Shortcuts & Widgets",systemImage: "square.grid.2x2.fill")
                            HStack {
                                Button {
                                    
                                } label: {
                                    Text("Start Study Session")
                                        .foregroundStyle(.white)
                                        .padding(.horizontal)
                                        .padding(.vertical,5)
                                        .background(Capsule().fill(.primary))
                                }
                                Button {
                                                                
                                } label: {
                                    Text("Edit")
                                        .foregroundStyle(.primary)
                                        .padding(.horizontal)
                                        .padding(.vertical,5)
                                        .background(Capsule().fill(.white))
                                }
                            }
                            
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.primary.opacity(0.1))
                        )
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Focus")
        }
    }
    
    var TestView: some View {
        Text("hello")
    }
}

#Preview {
    FocusView()
}
