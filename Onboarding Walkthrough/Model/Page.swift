//
//  Page.swift
//  Onboarding Walkthrough
//
//  Created by mac on 4/28/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation




struct Page: Identifiable {
    
    let id: UUID
    let image: String
    let heading: String
    let subSubheading: String
    
    static var getAll: [Page] {
        [
            Page(id: UUID(), image: "screen-1", heading: "Sign To The App", subSubheading: "use your email or your phone number to sign in and get access to all the features"),
            Page(id: UUID(), image: "screen-2", heading: " Activate Your Pass ", subSubheading: " Activate your Silver or Gold Pass before you can begin browsing. This must be done within 11 months of the issuing date "),
            Page(id: UUID(), image: "screen-3", heading: " Enjoiy The Speed ", subSubheading: " Enjoy download speeds up to 75Mbps. Plus, combine with the TV to stream to multiple devices throughout your home. ")
            
        ]
    }
}
