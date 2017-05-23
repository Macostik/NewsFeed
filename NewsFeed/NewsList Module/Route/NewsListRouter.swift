//
//  NewsListRouter.swift
//  
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.

import UIKit

class NewsListRouter: NewsListRouterProtocol {

    func showNewsListScreen() {

        let viewController = Storyboard.NewsList.instantiate()
        let presenter = NewsListPresenter()
        let router = NewsListRouter()
        let interactor = NewsListInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        viewController.presenter = presenter
        
        let mainWindow = UIWindow.mainWindow
        mainWindow.rootViewController = viewController
        mainWindow.makeKeyAndVisible()
    }
    
    func showNewsDetailScreen() {
        NewsDetailRouter().showNewsDetailScreen()
    }
}
    
