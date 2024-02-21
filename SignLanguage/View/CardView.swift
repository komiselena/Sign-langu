//
//  ContentView.swift
//  SignLanguage
//
//  Created by Mac on 12.02.2024.
//
import SwiftUI

struct CardView: View {
    @State var card: Card
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    
    var body: some View {
        Text("Tap and swipe")
            .font(.largeTitle)
            .foregroundStyle(.tertiary)
            .offset(y: -300)
        VStack {
            if !card.isFaceUp{
                ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 300, height: 350)
                        .foregroundColor(.accentColor)
                        .shadow(color: .white, radius: 0.5)
                    Text(card.sign)
                        .font(.system(size: 70, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                }
            }else{
                Image(card.image)
                    .resizable()
                    .frame(width: 300, height: 350)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
            }
        }
        .padding()
        .onTapGesture {
            if card.isFaceUp{
                card.isFaceUp = false
            }else{
                card.isFaceUp = true
            }
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }.onEnded { _ in
                    withAnimation{
                        swipeCard(width: offset.width)
                    }
                }
            )
        }
    func swipeCard(width: CGFloat){
        switch width {
        case 150...500:
            offset = CGSize(width: 500, height: 0)
            
        default:
            offset = .zero
        }
    }
}



#Preview {
    CardView(card: Card(image: "0", sign: "0", isFaceUp: false))
}
