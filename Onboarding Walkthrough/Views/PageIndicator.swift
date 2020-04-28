//
//  PageIndicator.swift
//  Onboarding Walkthrough
//
//  Created by mac on 4/28/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct PageIndicator: View {
    
    var currentIndex: Int = 0
    var pagesCount: Int = 3
    var onColor: Color = Color.black
    var offColor: Color = Color.offColor
    var diameter: CGFloat = 10
    
    var body: some View {
        HStack{
            ForEach(0..<pagesCount){ i in
                Image(systemName: "circle.fill").resizable()
                    .foregroundColor( i == self.currentIndex ? self.onColor : self.offColor)
                    .frame(width: self.diameter, height: self.diameter)

            }
        }
    }
}

struct PageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicator()
    }
}
