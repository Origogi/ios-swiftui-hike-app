//
//  SettingsView.swift
//  Hike
//
//  Created by 김정태 on 12/27/23.
//

import SwiftUI

struct SettingsView: View {

  private let alternateAppIcons: [String] = [
    "AppIcon-MagnifyingGlass",
    "AppIcon-Map",
    "AppIcon-Mushroom",
    "AppIcon-Camera",
    "AppIcon-Backpack",
    "AppIcon-Campfire",
  ]

  var body: some View {
    List {
      //MARK : - Section : Header
      Section {
        HStack {
          Spacer()
          Image(systemName: "laurel.leading")
            .font(.system(size: 80, weight: .black))
          VStack(spacing: -10) {
            Text("Hike")
              .font(.system(size: 66, weight: .black))

            Text("Editor's Choice")
          }
          Image(systemName: "laurel.trailing")
            .font(.system(size: 80, weight: .black))
          Spacer()
        }
          .foregroundStyle(
          LinearGradient(colors: [
              .customGreenLight,
              .customGreenMedium,
              .customGreenDark
            ], startPoint: .top, endPoint: .bottom)
        ).padding(.top, 8)

        VStack(spacing: 8) {

          Text("Where can you find\nperfect tracks?")
            .font(.title2)
            .fontWeight(.heavy)

          Text("The hike which looks gorgeous in photos but os even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
            .font(.footnote)
            .italic()

          Text("Dust off the boots! It's time for a walk")
            .fontWeight(.heavy)
            .foregroundColor(.customGreenMedium)

        }
          .multilineTextAlignment(.center)
          .padding(.bottom, 16)
          .frame(maxWidth: .infinity)
      } // : Header
      .listRowSeparator(.hidden)

      //MARK : - Section: Icons
      Section(header: Text("Alternative Icons")) {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 12) {
            ForEach(alternateAppIcons.indices, id: \.self) { item in
              Button {
                print("Icon \(alternateAppIcons[item]) was pressed")
                
                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                  if let error = error {
                    print("Error: \(error.localizedDescription)")
                  } else {
                    print("Success! You have changed the app icon.")
                  }
                }
              } label: {
                Image("\(alternateAppIcons[item])-Preview")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 80, height: 80)
                  .cornerRadius(16)
              }.buttonStyle(.borderless)
            }
          } //: Scrollview
        }.padding(.top, 12)

        Text("Choose your favourite app icon from the collection above")
          .frame(minWidth: 0, maxWidth: .infinity)
          .multilineTextAlignment(.center)
          .foregroundColor(.secondary)
          .font(.footnote)
          .padding(.bottom, 12)
      }.listRowSeparator(.hidden)


      //MARK : - Section: About

      Section(header: Text("ABOUT THE APP"), footer: HStack {
          Spacer()
          Text("Copyright All rights reserved")
          Spacer()
        }.padding(.vertical, 8)) {
        CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
        CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS", rowTintColor: .red)
        CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
        CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
        CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Jone Doe", rowTintColor: .mint)
        CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
        CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Credo Academy", rowLinkDestination: "https://credo.academy")
      }
    }
  }
}

#Preview {
  SettingsView()
}
