//
//  PreviewProvider_.swift
//  swift-ui-map-app-prototype
//
//  Created by Rick Brown on 28/12/2021.
//

import SwiftUI

extension PreviewProvider {
  static var dev: DeveloperPreview {
    DeveloperPreview.instance
  }
}

class DeveloperPreview {
  static let instance = DeveloperPreview()
  
  private init() {}
  
  let vm = LocationsViewModel()
}
