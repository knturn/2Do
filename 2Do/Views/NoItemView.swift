//
//  NoItemView.swift
//  2Do
//
//  Created by Turan, Kaan on 20.02.2023.
//

import SwiftUI

struct NoItemView: View {
    @State var animate = false
    var body: some View {
        VStack {
            Text("You haven't got anything to do?")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 100)
                .padding(.bottom, 20)
            Text("Are you a productive person? I think of course you are ! Click the add button and don't delay something")
               
                .padding(.bottom, 20)
            NavigationLink(destination: AddView()) {
                Text("Add something 🥳")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? .red : .accentColor)
                    .cornerRadius(10)
            }
            .padding(.horizontal, animate ? 30 : 50)
            .shadow(color: animate ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 30 : 10, y: animate ? 50 : 30)
            .scaleEffect(animate ? 1.1 : 1.0)
            .offset(y: animate ? -7 : 0)
            
            Spacer()

        }
        .multilineTextAlignment(.center)
        .padding(40)
        .onAppear(perform: addAnimation)
    }
    private func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
        }
       
    }
}
