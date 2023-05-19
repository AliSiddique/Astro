//
//  CometsHomeView.swift
//  Solarsystem
//
//  Created by Ali Siddique on 17/05/2023.
//

import SwiftUI

struct CometsHomeView: View {
    var body: some View {
        ZStack {
            Image("Image10")
                .resizable()
                .ignoresSafeArea()
            VStack {
                ForEach(comets) { satellite in
                    HStack {
                        AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Earth_from_Space.jpg/1200px-Earth_from_Space.jpg?20070814130228")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .mask(RoundedRectangle(cornerRadius: 30))
                        } placeholder: {
                            ProgressView()
                        }
                        Text(satellite.name)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(.black.opacity(0.5))
                    .mask(RoundedRectangle(cornerRadius: 40))
                }
            }
        }
    }
}

struct CometsHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CometsHomeView()
    }
}
