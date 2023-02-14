//
//  ListView.swift
//  2Do
//
//  Created by Turan, Kaan on 14.02.2023.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            Text("2DoApp!")
        }
        .navigationTitle("2DO")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
    }
}
