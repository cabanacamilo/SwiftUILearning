//
//  AddView.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/28.
//

import SwiftUI

struct AddView: View {
    
    @Binding var isPresented: Bool
    @State private var backgroundOpacity = 0.0
    @State private var viewHeight = 0.0
    @Binding var addNewItem: AddNewItem
    
    var body: some View {
        if isPresented {
            GeometryReader { geomtry in
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(backgroundOpacity)
                    VStack(spacing: 20) {
                        Spacer()
                        HStack(spacing: 20) {
                            VStack(alignment: .center, spacing: 10) {
                                Button {
                                    dismissView(item: .expense)
                                } label: {
                                    Image(systemName: "square.grid.3x1.folder.fill.badge.plus")
                                        .font(.title)
                                        .tint(.white)
                                }
                                .frame(width: 60, height: 60, alignment: .center)
                                .background(Color(.systemBlue))
                                .clipShape(Circle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                Text("New Expense")
                                    .font(.system(size: 12))
                            }
                            
                            
                            VStack(alignment: .center, spacing: 10) {
                                Button {
                                    dismissView(item: .calendar)
                                } label: {
                                    Image(systemName: "calendar")
                                        .font(.title)
                                        .tint(.white)
                                }
                                .frame(width: 60, height: 60, alignment: .center)
                                .background(Color(.systemBlue))
                                .clipShape(Circle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                Text("New Calendar")
                                    .font(.system(size: 12))
                                
                            }
                            
                            VStack(alignment: .center, spacing: 10) {
                                Button {
                                    dismissView(item: .receipt)
                                } label: {
                                    Image(systemName: "newspaper.fill")
                                        .font(.title)
                                        .tint(.white)
                                }
                                .frame(width: 60, height: 60, alignment: .center)
                                .background(Color(.systemBlue))
                                .clipShape(Circle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                Text("New Receipt")
                                    .font(.system(size: 12))
                            }
                            
                        }
                        Button {
                            dismissView(item: .dismiss)
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .font(.largeTitle)
                            
                        }
                        Spacer()
                    }
                    .frame(width: geomtry.size.width, height: viewHeight, alignment: .top)
                    .background(Color(.white))
                    .clipShape(RoundedCornersShape(corners: [.topLeft, .topRight], radius: 30))
                }
            }
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.easeInOut(duration: 0.3)) {
                    backgroundOpacity = 0.5
                    viewHeight = 200
                }
            }
        }
    }
    
    func dismissView(item: AddNewItem) {
        withAnimation(.easeInOut(duration: 0.3)) {
            backgroundOpacity = 0
            viewHeight = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isPresented = false
            addNewItem = item
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(isPresented: .constant(false), addNewItem: .constant(.dismiss))
    }
}
