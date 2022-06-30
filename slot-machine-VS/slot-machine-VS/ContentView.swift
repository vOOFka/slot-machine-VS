//
//  ContentView.swift
//  slot-machine-VS
//
//  Created by Home on 30.06.2022.
//

import SwiftUI

struct ContentView: View {
    let emodjiArray = ["⭐️", "☀️", "💦", "🍉", "⛄️", "🐳", "🐥", "✂️", "🎁", "☎️"]
    
    var body: some View {
        HStack {
            Text(getRandomEmoji())
                .padding(20.0)
            Text(getRandomEmoji())
                .padding(20.0)
            Text(getRandomEmoji())
                .padding(20.0)
        }
        Button(action: {
            playButtonTap()
        }, label: {
            Text("Play")
                .padding(5.0)
                .frame(width: 100.0)
        })
           // .disabled(username.isEmpty || password.isEmpty)
            .foregroundColor(.white)
            .accentColor(.black)
            .background(.mint)
            .cornerRadius(5.0)
            .padding(.top, 30.0)
    }
    
    private func getRandomEmoji() -> String {
        emodjiArray.randomElement() ?? "🎲"
     }
    
    private func playButtonTap() {
        print("Play button tap")
     }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
