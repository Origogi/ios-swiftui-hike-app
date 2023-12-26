//
//  MotionAnimationView.swift
//  Hike
//
//  Created by 김정태 on 12/26/23.
//

import SwiftUI

struct MotionAnimationView: View {
  //MARK : - Properties
  @State private var randomCircle = Int.random(in: 6...12)
  @State private var isAnimating = false

  //MARK : - Functions

  // 1. random coordinate
  func randomCooridate() -> CGFloat {
    return CGFloat.random(in: 0...256)
  }
  // 2. random size

  func randomSize() -> CGFloat {
    return CGFloat.random(in: 4...80)
  }
  // 3. random scale
  func randomScale() -> CGFloat {
    return CGFloat(Double.random(in: 0.1...2.0))
  }
  // 4. random speed
  func randomSpeed() -> Double {
    return Double.random(in: 0.05...1.0)
  }
  // 5. random delay
  func randomDelay() -> Double {
    return Double.random(in: 0...2)
  }

  var body: some View {
    ZStack {
      ForEach(0...randomCircle, id: \.self) { item in
        Circle()
          .foregroundColor(.white)
          .opacity(0.25)
          .frame(width: randomSize())
          .position(
          x: randomCooridate(),
          y: randomCooridate()
        )
          .scaleEffect(isAnimating ? randomScale() : 1)
          .onAppear(
          perform: {
            withAnimation(
                .interpolatingSpring(
                stiffness: 0.25, damping: 0.25
              )
                .repeatForever()
                .speed(randomSpeed())
                .delay(randomDelay())
            ) {
              isAnimating = true
            }
          }
        )

      }

    } // : ZStack
    .frame(width: 256, height: 256)
  }
}

#Preview {
  ZStack {
    Color.teal.ignoresSafeArea()
    MotionAnimationView()
  }
}
