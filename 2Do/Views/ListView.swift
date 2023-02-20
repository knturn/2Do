//
//  ListView.swift
//  2Do
//
//  Created by Turan, Kaan on 14.02.2023.
//

import SwiftUI

struct ListView: View {
    @State var presentationState = false
    @EnvironmentObject var viewModel: ListViewModel
    var body: some View {
        ZStack {
            if !viewModel.items.isEmpty {
                List {
                    ForEach(viewModel.items) { item in
                        ListRowView(element: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    viewModel.changeIsDone(item: item)
                                }
                            }
                        
                    }
                    .onDelete(perform: viewModel.deleteElement)
                    .onMove(perform: viewModel.moveElement)
                }
                .listStyle(.plain)
            } else {
                NoItemView()
            }
        }
       
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("Add", destination: AddView())
                            
        )
        .navigationTitle("2DO 📝")
    }
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
