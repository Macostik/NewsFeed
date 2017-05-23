//
//  NewsDetailRouter.swift
//  
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.

import UIKit

class NewsDetailRouter: NewsDetailRouterProtocol {

    func showNewsDetailScreen() {

    	let viewController = Storyboard.NewsDetail.instantiate()
        let presenter = NewsDetailPresenter()
        let router = NewsDetailRouter()
        let interactor = NewsDetailInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        viewController.presenter = presenter

        let presentingViewController = UIWindow.mainWindow.rootViewController
        presentingViewController?.present(viewController, animated: true, completion: nil)
    }
}
    
