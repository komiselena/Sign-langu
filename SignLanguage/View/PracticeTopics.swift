//
//  PracticeTopics.swift
//  SignLanguage
//
//  Created by Mac on 15.02.2024.
//

import SwiftUI

struct PracticeTopics: View {
    var body: some View {
        ZStack{
            RadialGradient(colors: [.colorstartpoint, .colorendpoint], center: .bottomLeading, startRadius: 300, endRadius: 100)
                .ignoresSafeArea()
            
            PracticeButtonsTopics(practiceVideo: PracticeVideo(video: "mouse", name: "mouse"))
        }
    }
}

struct PracticeButtonsTopics: View {
    @State var practiceVideo: PracticeVideo
    @State private var animalsPracticeView: Bool = false
    @State private var foodPracticeView: Bool = false
    @State private var commonphrasesPracticeView: Bool = false

    var body: some View {
        VStack{
            Text("Try it out!")
                .font(.system(size: 40, weight: .semibold, design: .rounded))
                .padding(10)
            Spacer()
            
            Button(action: {
                animalsPracticeView = true
            }, label: {
                Text("Animals")
                    .font(.largeTitle)
                    .foregroundStyle(Color.accentColor)
                    .frame(width: 300, height: 75)
                    .background(Color.secondary)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            })
            .sheet(isPresented: $animalsPracticeView){
                PracticeView(practvideo: practiceVideo.animals.randomElement() ?? PracticeVideo(video: "dog", name: "dog"))
            }
            
            Button(action: {
                foodPracticeView = true
            }, label: {
                Text("Food")
                    .font(.largeTitle)
                    .foregroundStyle(Color.accentColor)
                    .frame(width: 300, height: 75)
                    .background(Color.secondary)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            })
            .sheet(isPresented: $foodPracticeView){
                PracticeView(practvideo: practiceVideo.food.randomElement() ?? PracticeVideo(video: "apple", name: "apple"))
            }
            Button(action: {
                commonphrasesPracticeView = true
            }, label: {
                Text("Some phrases")
                    .font(.largeTitle)
                    .foregroundStyle(Color.accentColor)
                    .frame(width: 300, height: 75)
                    .background(Color.secondary)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            })
            .sheet(isPresented: $commonphrasesPracticeView){
                PracticeView(practvideo: practiceVideo.commonPhrases.randomElement() ?? PracticeVideo(video: "iamsorry", name: "iamsorry"))
            }
            Spacer()
        }
    }
}

#Preview {
    PracticeTopics()
}
