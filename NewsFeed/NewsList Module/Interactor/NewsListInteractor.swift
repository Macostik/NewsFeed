//
//  NewsListInteractor.swift
//  
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.

import RealmSwift

class NewsListInteractor: NewsListInteractorProtocol {

    var output: NewsListInteractorOutput?
    var localStorageManager: LocalStorageInteractor?  {
        willSet {
            DataStorage().setupDataBase()
        }
    }
    var remoteStorageManager: RemoteStorageInteractor?
    
    func recieveNewsFeed() {
        guard let localStorageManager = localStorageManager,
              let remoteStorageManager = remoteStorageManager else { return }
        let feedsList = localStorageManager.recieveNewsFeed()
        if feedsList.count != 0 {
            output?.handleNewsFeed(feedsList: feedsList)
        } else {
            remoteStorageManager.recieveNewsFeed { [weak self] feedsList in
                self?.output?.handleNewsFeed(feedsList: feedsList)
            }
        }
    }
}

class DataStorage {
    func setupDataBase() {
        let realm = try! Realm()
        if let url = realm.configuration.fileURL {
            Logger.log("FileURL of DataBase - \(url)", color: .Orange)
        } 
    }
}
