//
//  CustomCircleView.swift
//  Hike
//
//  Created by 김정태 on 12/26/23.
//

import SwiftUI

struct CustomCircleView: View {

  @State private var isAnimateGradient = false

  var body: some View {
    ZStack {
      Circle()
        .fill(
        LinearGradient(colors: [
            .customIndigoMedium,
            .customSalmonLight
          ], startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
          endPoint: isAnimateGradient ? .bottomTrailing : .topLeading)
      ).onAppear {
        withAnimation(
            .linear(duration: 3).repeatForever(autoreverses: true)
        ) {
          isAnimateGradient.toggle()
        }
      }
      MotionAnimationView()
    } 
    .frame(width: 256, height: 256, alignment: .center)
    .mask(Circle())
    .drawingGroup()

  }
}

#Preview {
  CustomCircleView()
}
