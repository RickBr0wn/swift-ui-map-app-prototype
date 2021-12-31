//
//  LocationsPreviewView.swift
//  swift-ui-map-app-prototype
//
//  Created by Rick Brown on 31/12/2021.
//

import SwiftUI

struct LocationsPreviewView: View {
  @EnvironmentObject private var vm: LocationsViewModel
  let location: Location
  
  var body: some View {
    HStack(alignment: .bottom) {
      VStack(alignment: .leading, spacing: 16.0) {
        rowImage
        rowTitle
      }
      
      VStack(spacing: 8.0) {
        learnMoreButton
        nextButton
      }
    }
    .padding(20.0)
    .background(
      RoundedRectangle(cornerRadius: 10.0)
        .fill(.ultraThinMaterial)
        .offset(y: 65)
    )
    .cornerRadius(10.0)
  }
}

extension LocationsPreviewView {
  private var rowImage: some View {
    ZStack {
      if let imageName = location.imageNames.first {
        Image(imageName)
          .resizable()
          .scaledToFill()
          .frame(width: 100.0, height: 100.0)
          .cornerRadius(10.0)
      }
    }
    .padding(6)
    .background(Color.white)
    .cornerRadius(10.0)
  }
  
  private var rowTitle: some View {
    VStack(alignment: .leading, spacing: 4.0) {
      Text(location.name)
        .font(.title2)
        .fontWeight(.bold)
      
      Text(location.cityName)
        .font(.subheadline)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  private var learnMoreButton: some View {
    Button(action: {
      vm.sheetLocation = location
    }) {
      Text("Learn more")
        .font(.headline)
        .frame(width: 125.0, height: 35.0)
    }
    .buttonStyle(.borderedProminent)
  }
  
  private var nextButton: some View {
    Button(action: {
      vm.nextButtonPressed()
    }) {
      Text("Next")
        .font(.headline)
        .frame(width: 125.0, height: 35.0)
    }
    .buttonStyle(.bordered)
  }
}

struct LocationsPreviewView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.green.ignoresSafeArea()
      LocationsPreviewView(location: dev.vm.location)
        .environmentObject(dev.vm)
        .padding()
    }
  }
}
