//
//  ExpandableButtonPanel.swift
//  ExpandableButtonSwiftUI
//
//  Created by Ashish Tyagi on 07/10/20.
//  Copyright © 2020 Ashish Tyagi. All rights reserved.
//

import Foundation
import SwiftUI

struct ExpandableButtonPanel: View {
    
    let primaryItem: ExpandableButtonItem
    let secondaryItems: [ExpandableButtonItem]
    
    private let shadowColor = Color.black.opacity(0.4)
    private let shadowPosition: (x: CGFloat, y: CGFloat) = (x: 2, y: 2)
    private let shadowRadius: CGFloat = 3
    
    private let size: CGFloat = 70
    private var cornerRadius: CGFloat {
        get { size / 2 }
    }
    private let noAction: () -> Void = {}
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            ForEach(secondaryItems) { item in
                Button(item.label, action: item.action ?? self.noAction)
                    .frame(
                        width: self.isExpanded ? self.size : 0,
                        height: self.isExpanded ? self.size : 0)
            }
            
            //.background(Color(UIColor.systemTeal))
            //.padding(.vertical, 5.0)
            
            Button(primaryItem.label, action: {
                withAnimation {
                    self.isExpanded.toggle()
                }
                self.primaryItem.action?()
            })
                .frame(width: size, height: size)
        }.background(Color(UIColor.systemPurple))
            .cornerRadius(cornerRadius)
            .font(.title)
            .shadow(
                color: shadowColor,
                radius: shadowRadius,
                x: shadowPosition.x,
                y: shadowPosition.y
        )
    }
}

struct ExpandableButtonPanel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
