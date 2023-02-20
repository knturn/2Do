//
//  ListRowView.swift
//  2Do
//
//  Created by Turan, Kaan on 14.02.2023.
//

import SwiftUI

struct ListRowView: View {
    let element: ToDoElement
    var body: some View {
        HStack {
            Image(systemName: element.isDone ? "checkmark.circle" : "circle")
                .foregroundColor(element.isDone ? .green : .blue)
            Text(element.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 10)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ToDoElement(title: "This is sample element", isDone: true)
    static var item2 = ToDoElement(title: "This is sample element 2", isDone: false)
    static var previews: some View {
        VStack {
            ListRowView(element: item1)
            ListRowView(element: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
