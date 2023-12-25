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
      VStack {
        //MARK : - header

        VStack(alignment: .leading) {
          HStack {
            Text("Hiking")
              .fontWeight(.black)
              .font(.system(size: 52))
              .foregroundStyle(
              LinearGradient(colors: [
                  .customGrayLight,
                  .customGrayMedium
                ], startPoint: .top, endPoint: .bottom)

            )
            
            Spacer()
            
            Button {
              print("Button pressed")
            } label: {
              CustomButtonView()
            }
          }
          Text("Fun and enjoyable outdoor activity for friends and families")
            .multilineTextAlignment(.leading)
            .italic()
            .foregroundColor(.customGrayMedium)
        } // : header
        .padding(.horizontal, 30)

        //MARK : - Main Content
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

        //MARK : - footer
      }
    }.frame(width: 320, height: 570)
  }
}

#Preview {
  CardView()
}
