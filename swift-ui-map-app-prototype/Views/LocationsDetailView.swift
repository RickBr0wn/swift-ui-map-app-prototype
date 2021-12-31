//
//  LocationsDetailView.swift
//  swift-ui-map-app-prototype
//
//  Created by Rick Brown on 31/12/2021.
//
import MapKit
import SwiftUI

struct LocationsDetailView: View {
  @EnvironmentObject private var vm: LocationsViewModel
  let location: Location
  
  var body: some View {
    ScrollView {
      VStack {
        images
          .shadow(color: Color.black.opacity(0.3), radius: 20.0, x: 0.0, y: 10.0)
        
        VStack(alignment: .leading, spacing: 16.0) {
          title
          Divider()
          description
          Divider()
          map
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
      }
    }
    .ignoresSafeArea()
    .background(.ultraThinMaterial)
    .overlay(backButton, alignment: .topLeading)
  }
}

extension LocationsDetailView {
  private var images: some View {
    TabView {
      ForEach(location.imageNames, id: \.self) { imageName in
        Image(imageName)
          .resizable()
          .scaledToFill()
          .frame(width: UIScreen.main.bounds.width)
          .clipped()
      }
    }
    .frame(height: 500.0)
    .tabViewStyle(PageTabViewStyle())
  }
  
  private var title: some View {
    VStack(alignment: .leading, spacing: 8.0) {
      Text(location.name)
        .font(.largeTitle)
        .fontWeight(.semibold)
      
      Text(location.cityName)
        .font(.title3)
        .foregroundColor(.secondary)
    }
  }
  
  private var description: some View {
    VStack(alignment: .leading, spacing: 16.0) {
      Text(location.description)
        .font(.subheadline)
        .foregroundColor(.secondary)
      
      if let url = URL(string: location.link) {
        Link("Read more on wikipedia", destination: url)
          .font(.headline)
          .tint(Color.blue)
      }
    }
  }
  
  private var map: some View {
    Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [location]) { location in
      MapAnnotation(coordinate: location.coordinates) {
        LocationsMapAnnotationView()
          .shadow(radius: 10.0)
      }
    }
    .allowsHitTesting(false)
    .aspectRatio(1, contentMode: .fit)
    .cornerRadius(30.0)
  }
  
  private var backButton: some View {
    Button {
      vm.sheetLocation = nil
    } label: {
      Image(systemName: "xmark")
        .font(.headline)
        .padding(16.0)
        .foregroundColor(.primary)
        .background(.thickMaterial)
        .cornerRadius(10.0)
        .shadow(radius: 4.0)
        .padding()
    }
  }
}

struct LocationsDetailView_Previews: PreviewProvider {
  static var previews: some View {
    LocationsDetailView(location: dev.vm.location)
      .environmentObject(dev.vm)
  }
}
