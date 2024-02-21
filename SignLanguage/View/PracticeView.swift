//
//  PracticeView.swift
//  SignLanguage
//
//  Created by Mac on 16.02.2024.
//

import SwiftUI
import AVKit

struct PracticeView: View {
    @State var practvideo: PracticeVideo
    @State private var player = AVPlayer()
    @State private var userstext: String = ""
    @State private var showCheckmark = false
    
    var body: some View {
        let video = VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: practvideo.video, withExtension: practvideo.ext)!))
        ZStack {
            RadialGradient(colors: [.colorendpoint, .colorstartpoint], center: .topTrailing, startRadius: 300, endRadius: 700)
                .ignoresSafeArea()
            VStack{
                video
                    .frame(width: 350, height: 380)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                HStack{
                    TextField("Translate it", text: $userstext, onCommit: {
                        if userstext == practvideo.name{
                            showCheckmark = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                userstext = ""
                                showCheckmark = false
                            }
                        }
                    })
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(width: 220, height: 90)
                    .textInputAutocapitalization(.never)
                    .font(.title)
                    .textCase(.lowercase)
                    
                    Button(action: {
                        if userstext == practvideo.name{
                            showCheckmark = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                userstext = ""
                                showCheckmark = false
                            }
                        }
                    }, label: {
                        Text("Input")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .padding()
                            .foregroundColor(.black)
                            .background(
                                Capsule()
                                    .tint(.white)
                                    .opacity(0.4)
                                    .frame(width: 80, height: 55)
                            )
                            .overlay(
                                Capsule()
                                    .stroke(Color.colorendpoint, lineWidth: 4)
                                    .frame(width: 80, height: 55)
                            )
                    })
                    
                }
                if showCheckmark {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.largeTitle)
                }
            }

            
        }
    }
}

#Preview {
    PracticeView(practvideo: PracticeVideo(video: "dog", name: "dog"))
}
