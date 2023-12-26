//
//  CardView.swift
//  Hike
//
//  Created by 김정태 on 12/24/23.
//

import SwiftUI

struct CardView: View {

  //MARK : - properties
  @State private var imageNumber = 1;
  @State private var randumNumber = 1

  func randomImage() {
    repeat {
      randumNumber = Int.random(in: 1...5)
    } while imageNumber == randumNumber

    imageNumber = randumNumber
    print(imageNumber)
  }

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

          Image("image-\(imageNumber)")
            .resizable()
            .scaledToFit()
            .animation(.default, value: imageNumber)
        }

        //MARK : - footer
        Button {
          randomImage()
        } label: {
          Text("Explore More")
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundStyle(
            LinearGradient(colors: [
                .customGreenLight,
                .customGreenMedium
              ],
              startPoint: .top,
              endPoint: .bottom
            )
          )
            .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)

        } .buttonStyle(GradientButtonStyle())
      } // : Card
    }.frame(width: 320, height: 570)
  }
}

#Preview {
  CardView()
}
