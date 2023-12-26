//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by 김정태 on 12/26/23.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration
      .label
      .padding(.horizontal, 20)
      .padding(.vertical)
      .background(

      configuration.isPressed ?
      LinearGradient(colors: [
          .customGrayMedium,
          .customGrayLight
        ], startPoint: .top, endPoint: .bottom): LinearGradient(colors: [
          .customGrayLight,
          .customGrayMedium
        ], startPoint: .top, endPoint: .bottom)

    ).cornerRadius(40)
  }

}
