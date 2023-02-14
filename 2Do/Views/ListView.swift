//
//  ListView.swift
//  2Do
//
//  Created by Turan, Kaan on 14.02.2023.
//

import SwiftUI

struct ListView: View {
    @State var items = [
    "This first item",
    "This is second",
    "This is third"
    ]
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .listStyle(.plain)
        .navigationBarItems(leading: EditButton(),
                            trailing:
                                NavigationLink("Add", destination: AddView())
        )
        .navigationTitle("2DO 📝")
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
    }
}


