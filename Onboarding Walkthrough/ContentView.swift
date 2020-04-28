//
//  ContentView.swift
//  Onboarding Walkthrough
//
//  Created by mac on 4/28/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            PageViewContainer( viewControllers: Page.getAll.map({  UIHostingController(rootView: PageView(page: $0) ) }))
        }.frame(maxHeight: .infinity).background(Color.backgroundColor).edgesIgnoringSafeArea(.all)  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
