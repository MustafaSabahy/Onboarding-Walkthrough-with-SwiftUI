//
//  PageView.swift
//  Onboarding Walkthrough
//
//  Created by mac on 4/28/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct PageView: View {
    
    var page = Page.getAll.first!
    
    var body: some View {
            VStack{
                
                Image(page.image)
                VStack{
                    Text(page.heading).font(.title).bold().layoutPriority(1).multilineTextAlignment(.center)
                    Text(page.subSubheading).font(.subheadline).multilineTextAlignment(.center)
                }.padding()
                  .background(Image("background1"))
            }
        
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
