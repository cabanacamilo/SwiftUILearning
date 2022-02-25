//
//  SettingsIView.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/25.
//

import SwiftUI

struct SettingsIView: View {
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State var image: Image = Image(systemName: "person")
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.3, alignment: .center)
                        .foregroundColor(Color(.systemGroupedBackground))
                        .ignoresSafeArea()
                    RoundedCornersShape(corners: [.topLeft, .topRight], radius: 30)
                        .fill(Color(UIColor.white))
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.15, alignment: .bottom)
                        .shadow(color: Color(.systemGray4), radius: 1, x: 0, y: -2)
                    VStack(spacing: 5) {
                        image
                            .frame(width: geometry.size.height * 0.15, height: geometry.size.height * 0.15, alignment: .center)
                            .font(.title)
                            .background(Color(.white))
                            .clipShape(Circle())
                            .shadow(color: Color(.systemGray4), radius: 1, x: 0, y: -2)
                            .aspectRatio(contentMode: .fill)
                            .onTapGesture { self.showingImagePicker.toggle() }
                        Text("Name")
                            .font(.title2)
                        Text("email@email.com")
                    }
                }
                List(0 ..< 5) { item in
                    Text("Settings \(item)")
                        
                }
                .listStyle(.plain)
            }
        }
        .sheet(isPresented: $showingImagePicker) { ImagePicker(image: $inputImage) }
        .onChange(of: inputImage) { newValue in self.loadImage() }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct SettingsIView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsIView()
    }
}
