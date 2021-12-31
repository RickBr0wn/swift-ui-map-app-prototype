//
//  LocationsView.swift
//  swift-ui-map-app-prototype
//
//  Created by Rick Brown on 22/12/2021.
//

import SwiftUI
import MapKit

struct LocationsView: View {
  @EnvironmentObject private var vm: LocationsViewModel
  
  var body: some View {
    ZStack {
      Map(coordinateRegion: $vm.region)
        .ignoresSafeArea()
      
      VStack(spacing: 0.0) {
        header
          .padding()
        
        Spacer()
        
        ZStack {
          ForEach(vm.locations) { location in
            if vm.location == location {
              LocationsPreviewView(location: location)
                .shadow(color: Color.black.opacity(0.3), radius: 20.0)
                .padding()
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            }
          }
        }
      }
    }
  }
}

extension LocationsView {
  private var header: some View {
    VStack {
      Button {
        vm.toggleLocationsList()
      } label: {
        Text(vm.location.name + ", " + vm.location.cityName)
          .font(.title2)
          .fontWeight(.black)
          .foregroundColor(.primary)
          .frame(height: 55.0)
          .frame(maxWidth: .infinity)
          .animation(.none, value: vm.location)
          .overlay(alignment: .leading) {
            Image(systemName: "arrow.down")
              .font(.headline)
              .foregroundColor(.primary)
              .padding()
              .rotationEffect(Angle(degrees: vm.showLocationsList ? 180.0 : 0))
          }
      }

      if vm.showLocationsList {
        LocationsListView()
      }
    }
    .background(.ultraThinMaterial)
    .cornerRadius(10.0)
    .shadow(color: Color.black.opacity(0.3), radius: 20.0, x: 0.0, y: 15.0)
  }
  
  
}

struct LocationsView_Previews: PreviewProvider {
  static var previews: some View {
    LocationsView()
      .environmentObject(dev.vm)
  }
}
