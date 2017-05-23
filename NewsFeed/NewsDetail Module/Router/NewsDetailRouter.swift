//
//  NewsDetailRouter.swift
//  
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.

import UIKit

class NewsDetailRouter: NewsDetailRouterProtocol {
    var navigationController: UINavigationController?

    static func pushNewsDetailScreen(navigationController: UINavigationController) {
    	let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailViewController") as! NewsDetailViewController
        let presenter = NewsDetailPresenter()
        let router = NewsDetailRouter()
        let interactor = NewsDetailInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter
        router.navigationController = navigationController
        
        navigationController.pushViewController(viewController, animated: true)
    }

    static func showNewsDetailScreen(window: UIWindow) {

    	let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailViewController") as! NewsDetailViewController
        let presenter = NewsDetailPresenter()
        let router = NewsDetailRouter()
        let interactor = NewsDetailInteractor()
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
    