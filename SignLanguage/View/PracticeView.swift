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
    @State private var roundRec: Bool = false
    var body: some View {
        ZStack {
            RadialGradient(colors: [.colorendpoint, .colorstartpoint], center: .topTrailing, startRadius: 300, endRadius: 700)
                .ignoresSafeArea()
            VStack{
                VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: practvideo.video, withExtension: practvideo.ext)!))
                    .frame(width: 350, height: 380)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                TextField("Translate it", text: $userstext)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(width: 350, height: 100)
                    .textInputAutocapitalization(.never)
                    .font(.title)
                    .textCase(.lowercase)
                    .onSubmit {
                        if userstext == practvideo.name{
                            
                        }
                    }
            }
        }
    }
}

#Preview {
    PracticeView(practvideo: PracticeVideo(video: "dog", name: "dog"))
}
