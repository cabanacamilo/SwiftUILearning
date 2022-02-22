//
//  ReceiptsView.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/22.
//

import SwiftUI

struct ReceiptsView: View {
    
    @StateObject private var viewModel = ReceiptsViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], alignment: .center, spacing: 20) {
                        ForEach(viewModel.receipts) { receipt in
                            AsyncImage(url: URL(string: receipt.media.image)!) { image in
                                image
                                    .frame(minWidth: geometry.size.width/3 - 30, maxWidth: geometry.size.width/3 - 30, minHeight: geometry.size.width/3 - 30, maxHeight: geometry.size.width/3 - 30, alignment: .center)
                                    .cornerRadius(10)
                                    .aspectRatio(contentMode: .fill)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            } placeholder: {
                                ProgressView()
                                    .frame(minWidth: geometry.size.width/3 - 30, maxWidth: geometry.size.width/3 - 30, minHeight: geometry.size.width/3 - 30, maxHeight: geometry.size.width/3 - 30, alignment: .center)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                
                            }
                        }
                    }
                }
                .navigationTitle("Receipts")
            }
        }
        .task {
            await viewModel.fecthReceipts()
        }
    }
}

struct ReceiptsView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptsView()
    }
}
