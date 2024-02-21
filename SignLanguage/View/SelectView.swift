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
                    Buttons(practiceVideo: PracticeVideo(video: "dog", name: "dog"), abccards: abccards, numcards: numcards)
                    Image("panda")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 200, height: 200)
                        .padding(50)
                    
                }
                .padding()
            }
        }
    }
}

struct Buttons: View{
    @State var practiceVideo: PracticeVideo
    @State private var animalsPracticeView: Bool = false
    @State private var foodPracticeView: Bool = false
    @State private var commonphrasesPracticeView: Bool = false
    @State var abccards: [Card]
    @State var numcards: [Card]
    var body: some View{
        VStack{
            Text("Let's learn")
                .font(.system(size: 25, weight: .semibold, design: .rounded))
                .padding(10)
            
            NavigationLink(destination: {
                ZStack{
                    RadialGradient(colors: [.colorstartpoint, .colorendpoint], center: .bottomTrailing, startRadius: 600, endRadius: 400)
                        .ignoresSafeArea()
                    ForEach(abccards, id: \.self) { abccard in
                        CardView(card: abccard)

                    }
                }
            }, label: {
                Text("🔤Alphabet")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding()
                    .foregroundColor(.black)
                    .background(
                        Capsule()
                            .tint(.white)
                            .opacity(0.4)
                            .frame(width: 270, height: 55)
                    )
                    .overlay(
                        Capsule()
                            .stroke(Color.colorendpoint, lineWidth: 4)
                            .frame(width: 270, height: 55)
                    )
            })
            NavigationLink(destination: {
                ZStack{
                    RadialGradient(colors: [.colorstartpoint, .colorendpoint], center: .bottomTrailing, startRadius: 400, endRadius: 700)
                        .ignoresSafeArea()
                    ForEach(numcards, id: \.self) { numcard in
                        CardView(card: numcard)
                    }
                }
            }, label: {
                Text("🔢Numbers")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding()
                    .foregroundColor(.black)
                    .background(
                        Capsule()
                            .tint(.white)
                            .opacity(0.4)
                            .frame(width: 270, height: 55)
                    )
                    .overlay(
                        Capsule()
                            .stroke(Color.colorendpoint, lineWidth: 4)
                            .frame(width: 270, height: 55)
                    )
            })
            .padding(10)
            Text("Practice")
                .font(.system(size: 25, weight: .semibold, design: .rounded))
                .padding(10)
            Button(action: {
                animalsPracticeView = true
            }, label: {
                Text("🐼Animals")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding()
                    .foregroundColor(.black)
                    .background(
                        Capsule()
                            .tint(.white)
                            .opacity(0.4)
                            .frame(width: 270, height: 55)
                    )
                    .overlay(
                        Capsule()
                            .stroke(Color.colorendpoint, lineWidth: 4)
                            .frame(width: 270, height: 55)
                    )
            })
            .sheet(isPresented: $animalsPracticeView){
                PracticeView(practvideo: practiceVideo.animals.randomElement() ?? PracticeVideo(video: "dog", name: "dog"))
            }
            
            Button(action: {
                foodPracticeView = true
            }, label: {
                Text("🍲Food")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding()
                    .foregroundColor(.black)
                    .background(
                        Capsule()
                            .tint(.white)
                            .opacity(0.4)
                            .frame(width: 270, height: 55)
                    )
                    .overlay(
                        Capsule()
                            .stroke(Color.colorendpoint, lineWidth: 4)
                            .frame(width: 270, height: 55)
                    )
            })
            .sheet(isPresented: $foodPracticeView){
                PracticeView(practvideo: practiceVideo.food.randomElement() ?? PracticeVideo(video: "apple", name: "apple"))
            }
            Button(action: {
                commonphrasesPracticeView = true
            }, label: {
                Text("🗣️Some phrases")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding()
                    .foregroundColor(.black)
                    .background(
                        Capsule()
                            .tint(.white)
                            .opacity(0.4)
                            .frame(width: 270, height: 55)
                    )
                    .overlay(
                        Capsule()
                            .stroke(Color.colorendpoint, lineWidth: 4)
                            .frame(width: 270, height: 55)
                    )
            })
            .sheet(isPresented: $commonphrasesPracticeView){
                PracticeView(practvideo: practiceVideo.commonPhrases.randomElement() ?? PracticeVideo(video: "iamsorry", name: "iamsorry"))
            }
            
        }
        .padding()
    }
}

struct Preview: View {
    let card = Card(image: "0", sign: "0", isFaceUp: false)
    var body: some View {
        SelectView( abccards: card.alphabet, numcards: card.numbers)
    }
}

