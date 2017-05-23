//
//  Feed.swift
//  NewsFeed
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright © 2017 Yura Granchenko. All rights reserved.
//

import Foundation
import RealmSwift

class Feed: Object {
    
    dynamic var author = ""
    dynamic var title = ""
//    dynamic var description = ""
    dynamic var url = ""
    dynamic var urlToImage = ""
//    dynamic var publishedAt = ""
    
    override static func primaryKey() -> String? {
        return "title"
    }
}
