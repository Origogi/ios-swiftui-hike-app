//
//  CardView.swift
//  Hike
//
//  Created by 김정태 on 12/24/23.
//

import SwiftUI

struct CardView: View {
  var body: some View {
    ZStack {
      CustomBackgroundView()
      ZStack {
        Circle()
          .fill(
          LinearGradient(colors: [
            Color("ColorIndigoMedium"),
            Color("ColorSalmonLight")
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
        ).frame(width: 256, height: 256, alignment: .center)

        Image("image-1")
          .resizable()
          .scaledToFit()
      }
    }.frame(width: 320, height: 570)
  }
}

#Preview {
  CardView()
}
