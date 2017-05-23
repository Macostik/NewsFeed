//
//  LocalStorageManager.swift
//  NewsFeed
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright © 2017 Yura Granchenko. All rights reserved.
//

import Foundation
import RealmSwift

protocol LocalStorageInteractor {
    func recieveNewsFeed() -> [Feed] 
}

class LocalStorageManager: LocalStorageInteractor {
 
    func recieveNewsFeed() -> [Feed] {
        
        let realm = try! Realm()
        return realm.objects(Feed.self).array()
    }
}
