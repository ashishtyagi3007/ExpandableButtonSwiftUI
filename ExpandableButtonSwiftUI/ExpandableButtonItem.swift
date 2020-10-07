//
//  ExpandableButtonItem.swift
//  ExpandableButtonSwiftUI
//
//  Created by Ashish Tyagi on 07/10/20.
//  Copyright © 2020 Ashish Tyagi. All rights reserved.
//

import Foundation

struct ExpandableButtonItem: Identifiable {
  let id = UUID()
  let label: String
  private(set) var action: (() -> Void)? = nil
}
