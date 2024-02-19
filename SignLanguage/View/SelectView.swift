//
//  SelectView.swift
//  SignLanguage
//
//  Created by Mac on 14.02.2024.
//

import SwiftUI

struct SelectView: View {
    @State var abccards: [Card]
    @State var numcards: [Card]
    var body: some View {
        NavigationStack{
            ZStack{
                RadialGradient(colors: [.colorstartpoint, .colorendpoint], center: .bottom, startRadius: 300, endRadius: 100)
                    .ignoresSafeArea()
                
                VStack{
                    Text("Let's learn")
                        .font(.system(size: 40, weight: .semibold, design: .rounded))
                        .padding(10)
                    Spacer()
                    NavigationLink(destination: {
                        
                        ZStack{
                            RadialGradient(colors: [.colorstartpoint, .colorendpoint], center: .bottomTrailing, startRadius: 600, endRadius: 400)
                                .ignoresSafeArea()
                            ForEach(abccards, id:\.self) { abccard in
                                CardView(card: abccard)
                            }
                        }
                    }, label: {
                        Text("ABC: Alphabet")
                            .font(.largeTitle)
                            .foregroundStyle(Color.accentColor)
                            .frame(width: 300, height: 75)
                            .background(Color.secondary)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    })
                    NavigationLink(destination: {
                        
                        ZStack{
                            RadialGradient(colors: [.colorstartpoint, .colorendpoint], center: .bottomTrailing, startRadius: 400, endRadius: 700)
                                .ignoresSafeArea()
                            ForEach(numcards) { numcard in
                                CardView(card: numcard)
                            }
                        }
                    }, label: {
                        Text("123: Numbers")
                            .font(.largeTitle)
                            .foregroundStyle(Color.accentColor)
                            .frame(width: 300, height: 75)
                            .background(Color.secondary)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    })
                    Divider()
                    NavigationLink(destination: {
                        PracticeTopics()
                    }, label: {
                        Text("Practice it")
                            .font(.largeTitle)
                            .foregroundStyle(Color.accentColor)
                            .frame(width: 300, height: 75)
                            .background(Color.secondary)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    })
                    Spacer()
                    Image("panda")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 200, height: 200)
                        .padding(50)
                    
                }
            }
        }
    }
}

struct Preview: View {
    var body: some View {
        let card = Card(image: "A", sign: "A", isFaceUp: true)
        SelectView(abccards: card.alphabet, numcards: card.numbers)
    }
}

