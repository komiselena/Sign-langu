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
                ScrollView{
                    ForEach(practiceVideo.animals.shuffled(), id: \.self){ animal in
                        PracticeView(practvideo: animal)
                    }
                }
            }
            
            Button(action: {
                animalsPracticeView = true
            }, label: {
                Text("Food")
                    .font(.largeTitle)
                    .foregroundStyle(Color.accentColor)
                    .frame(width: 300, height: 75)
                    .background(Color.secondary)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            })
            .sheet(isPresented: $animalsPracticeView){
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Sheet Content")/*@END_MENU_TOKEN@*/
            }
            Button(action: {
                animalsPracticeView = true
            }, label: {
                Text("Some phrases")
                    .font(.largeTitle)
                    .foregroundStyle(Color.accentColor)
                    .frame(width: 300, height: 75)
                    .background(Color.secondary)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            })
            .sheet(isPresented: $animalsPracticeView){
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Sheet Content")/*@END_MENU_TOKEN@*/
            }
            Spacer()
        }
    }
}

#Preview {
    PracticeTopics()
}
