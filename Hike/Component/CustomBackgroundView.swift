//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by 김정태 on 12/25/23.
//

import SwiftUI

struct CustomBackgroundView: View {
  var body: some View {
    ZStack {
      //MARK : - 3. DEPTH

      Color.customGreenDark
        .cornerRadius(40)
        .offset(y: 12)

      //MARK : - 2. Light
      Color.customGreenLight
        .cornerRadius(40)
        .offset(y: 3)
        .opacity(0.85)
      //MARK : - 1. surface

      LinearGradient(colors: [
        .customGreenLight,
        .customGreenMedium
        ], startPoint: .top, endPoint: .bottom)
        .cornerRadius(40)
    }
  }
}

#Preview {
  CustomBackgroundView()
}
