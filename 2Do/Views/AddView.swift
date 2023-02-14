//
//  AddView.swift
//  2Do
//
//  Created by Turan, Kaan on 14.02.2023.
//

import SwiftUI

struct AddView: View {
    @State var todo: String = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("", text: $todo, prompt: Text( "Let's write new todo...")
                    .foregroundColor(.secondary))
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(.lightGray))
                .cornerRadius(10)
                Button {
                    print("Tapped")
                } label: {
                    Image(systemName: "plus.app.fill")
                        .font(.title)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color(.orange)
                            .cornerRadius(10))
                }
            }
            .padding(15)
        }
        .navigationTitle("Add new item ✏️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
