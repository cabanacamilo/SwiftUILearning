//
//  CreateFileView.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/17.
//

import SwiftUI

struct CreateFileView: View {
    
    @Binding var isCreatingFilePresented: Bool
    @StateObject var viewModel = CreateFileViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Name")
                    .font(.title2)
                TextField("Name", text: $viewModel.name)
                    .padding()
                    .border(Color(.gray), width: 1)
                Text("Description")
                    .font(.title2)
                    .padding(.top)
                TextField("Description", text: $viewModel.description)
                    .padding()
                    .border(Color(.gray), width: 1)
                Spacer()
                Button("Save") {
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60, alignment: .center)
                .tint(.white)
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .font(.title)
            }
            .padding()
            .navigationTitle("Group")
            .navigationBarItems(trailing: Button(action: {
                isCreatingFilePresented = false
            }, label: {
                Image(systemName: "xmark")
            }))
        }
        
    
    }
}

struct CreateFileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFileView(isCreatingFilePresented: .constant(false))
.previewInterfaceOrientation(.portrait)
    }
}
