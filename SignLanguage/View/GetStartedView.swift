//
//  GetStartedView.swift
//  SignLanguage
//
//  Created by Mac on 13.02.2024.
//

import SwiftUI

struct GetStartedView: View {
    @State private var selectView: Bool = false
    @ScaledMetric var width = 400
    @ScaledMetric var height = 225
    @State var card: Card
    var body: some View {
        ZStack{
            RadialGradient(colors: [.colorstartpoint, .colorendpoint], center: .center, startRadius: 300, endRadius: 100)
                .ignoresSafeArea()
            VStack{
                Text("Speak with Your Hands!")
                    .font(.system(size: 40, weight: .semibold, design: .rounded))
                Spacer()
                Image("ear")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .frame(width: width, height: height)
                    
                Spacer()
                Button("Get Started", action: {
                    selectView = true
                    
                })
                .buttonStyle(.bordered)
                .font(.system(size: 35))
                
            }
            .padding(50)
        }
        .fullScreenCover(isPresented: $selectView, content: {
            SelectView(abccards: card.alphabet, numcards: card.numbers)
        })
    }
}

struct Preview1: View {
    var body: some View {
        let card = Card(image: "A", sign: "A", isFaceUp: true)
        GetStartedView(card: card)
    }
}
