//
//  LocationsMapAnnotationView.swift
//  swift-ui-map-app-prototype
//
//  Created by Rick Brown on 31/12/2021.
//

import SwiftUI

struct LocationsMapAnnotationView: View {
  let accentColor = Color("AccentColor")
  
  var body: some View {
    VStack(spacing: 0) {
      Image(systemName: "map.circle.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 30.0, height: 30.0)
        .font(.headline)
        .foregroundColor(.white)
        .padding(6)
        .background(accentColor)
        .cornerRadius(36.0)
      
      Image(systemName: "triangle.fill")
        .resizable()
        .scaledToFit()
        .foregroundColor(accentColor)
        .frame(width: 10.0, height: 10.0)
        .rotationEffect(Angle(degrees: 180.0))
        .offset(y: -3)
        .padding(.bottom, 40.0)
    }
  }
}

struct LocationsMapAnnotationView_Previews: PreviewProvider {
  static var previews: some View {
    LocationsMapAnnotationView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
