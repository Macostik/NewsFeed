//
//  NewsListProtocols.swift
//  
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.

import UIKit

protocol NewsListViewProtocol: class {
    var presenter: NewsListPresenterProtocol? { get set }
    
    func setupInitialState()
    func showLoading()
    func hideLoading()
    func showNewsFeed(feedList: [Feed])
}

protocol NewsListPresenterProtocol: class {
    var view: NewsListViewProtocol? { get set }
    var interactor: NewsListInteractorProtocol? { get set }
    var router: NewsListRouterProtocol? { get set }
    
    func viewIsReady()
    func showNewsDetailsScreen()
}

protocol NewsListInteractorProtocol: class {
    var output: NewsListInteractorOutput? { get set }
    var localStorageManager: LocalStorageInteractor? { get set }
    var remoteStorageManager: RemoteStorageInteractor? { get set }
    
    func recieveNewsFeed()
}

protocol NewsListInteractorOutput: class {
    func handleNewsFeed(feedsList: [Feed])
}

protocol NewsListRouterProtocol: class {
    func showNewsListScreen()
    func showNewsDetailScreen()
}
