//
//  DanousUser.swift
//  Danous
//
//  Created by Sanjeev RM on 06/01/24.
//

import Foundation

struct DanousUser: Hashable {
    var name: String
    var mobile: String
    
    static var SAMPLE_USERS: [DanousUser] = [DanousUser(name: "Paris", mobile: "5467890343"),
                                             DanousUser(name: "Italy", mobile: "6467890341"),
                                             DanousUser(name: "Greece", mobile: "9467890333"),
                                             DanousUser(name: "Sanfrisco", mobile: "9957268453")]
    
    static func reloadSampleUsers() {
        SAMPLE_USERS = [DanousUser(name: "Paris", mobile: "5467890343"),
                               DanousUser(name: "Italy", mobile: "6467890341"),
                               DanousUser(name: "Greece", mobile: "9467890333"),
                               DanousUser(name: "Sanfrisco", mobile: "9957268453")]
    }
}
