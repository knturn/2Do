//
//  ListRowView.swift
//  2Do
//
//  Created by Turan, Kaan on 14.02.2023.
//

import SwiftUI

struct ListRowView: View {
    let title: String
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
                .font(.system(size: 23))
            Text(title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "This is the first item")
    }
}
