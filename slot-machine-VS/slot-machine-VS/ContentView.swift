//
//  ContentView.swift
//  slot-machine-VS
//
//  Created by Home on 30.06.2022.
//

import SwiftUI

struct ContentView: View {
    let emodjiArray = ["⭐️", "☀️", "💦", "🍉", "⛄️", "🐳", "🐥", "✂️", "🎁", "☎️"]
    
    //For TEST WIN
    //let emodjiArray = ["⭐️", "☀️"]
    
    @State var isTimerRunning = false
    
    @State var emodjiLabelOne = "🎲"
    @State var emodjiLabelTwo = "🎲"
    @State var emodjiLabelThree = "🎲"
    
    @State private var showCongratulations = false
    
    let timer = Timer
        .publish(every: 0.2, on: .main, in: .common)
        .autoconnect()
        .share()        
    
    var body: some View {
        HStack {
            Text(emodjiLabelOne)
                .padding(20.0)
                .font(.system(size: 60))
            Text(emodjiLabelTwo)
                .padding(20.0)
                .font(.system(size: 60))
            Text(emodjiLabelThree)
                .padding(20.0)
                .font(.system(size: 60))
        }
        .padding(.bottom, 100.0)
        .onReceive(timer) { _ in
            changeSlotsEmoji()
        }
        
        Button(action: {
            playButtonTap()
        }, label: {
            Text("Play/Stop")
                .padding(20.0)
                .frame(width: 150.0)
        })
            .foregroundColor(.white)
            .accentColor(.black)
            .background(.mint)
            .cornerRadius(5.0)
            .padding(.top, 100.0)
            .alert(isPresented: $showCongratulations, content: { Alert(title: Text("Congratulations"), message: Text("YOU WIN !!!"))
            })
    }
    
    private func changeSlotsEmoji() {
        if isTimerRunning {
            emodjiLabelOne = emodjiArray.randomElement() ?? "🎲"
            emodjiLabelTwo = emodjiArray.randomElement() ?? "🎲"
            emodjiLabelThree = emodjiArray.randomElement() ?? "🎲"
        }
     }
    
    private func playButtonTap() {
        isTimerRunning.toggle()
        
        if !isTimerRunning,
           emodjiLabelOne == emodjiLabelTwo && emodjiLabelTwo == emodjiLabelThree {
            showCongratulations.toggle()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
