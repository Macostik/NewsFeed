//
//  RemoteStorageManager.swift
//  NewsFeed
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright © 2017 Yura Granchenko. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

protocol RemoteStorageInteractor {
    var interactor: NewsListInteractorProtocol? { get set }
    
    func recieveNewsFeed(_ completion: @escaping ([Feed]) -> Void)
}

class RemoteStorageManager: RemoteStorageInteractor {
    
    var interactor: NewsListInteractorProtocol?
    
    func recieveNewsFeed(_ completion: @escaping ([Feed]) -> Void) {
        
        var feedsList = [Feed]()
        
        let realm = try! Realm()
        
        let feedEntry = NewsFeedEntryParams(entryParameters: (baseURL: (MainURL.base.description, nil),
                                                               headerParameters: nil,
                                                               bodyParameters: nil))
        NewsFeedRequest.getNewsFeed(feedEntry, completion: { json, success in
            guard success == true, let json = json?["articles"] else { return }
            try! realm.write {
                for (_, feed) in json {
                    let feed = realm.create(Feed.self, value: feed.object, update: true)
                    feedsList.append(feed)
                }
            }
             completion(feedsList)
        })
    }
}
