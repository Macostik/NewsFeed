//
//  NewsListRouter.swift
//  
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.

import UIKit

class NewsListRouter: NewsListRouterProtocol {
    var navigationController: UINavigationController?

    static func pushNewsListScreen(navigationController: UINavigationController) {
    	let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsListViewController") as! NewsListViewController
        let presenter = NewsListPresenter()
        let router = NewsListRouter()
        let interactor = NewsListInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter
        router.navigationController = navigationController
        
        navigationController.pushViewController(viewController, animated: true)
    }

    static func showNewsListScreen(window: UIWindow) {

    	let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsListViewController") as! NewsListViewController
        let presenter = NewsListPresenter()
        let router = NewsListRouter()
        let interactor = NewsListInteractor()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        viewController.presenter = presenter
        router.navigationController = navigationController
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
    