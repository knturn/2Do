//
//  AddView.swift
//  2Do
//
//  Created by Turan, Kaan on 14.02.2023.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    @EnvironmentObject var listViewModel: ListViewModel
    @State var todo: String = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("", text: $todo, prompt: Text( "Let's write new todo...")
                    .foregroundColor(.secondary))
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .foregroundColor(.white)
                .cornerRadius(10)
                Button(action: addItem, label: {
                    Image(systemName: "plus.app.fill")
                        .font(.title)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.accentColor
                            .cornerRadius(10))
                        .alert(Text("Write something"), isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                }
                
                )
            }
            .padding(15)
        }
        .navigationTitle("Add new item ✏️")
    }
    private func addItem() {
        guard !todo.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            showingAlert = true
            return
        }
        let title = todo
        listViewModel.addNewItem(with: title)
        dismiss.callAsFunction()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
