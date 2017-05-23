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
}

protocol NewsListPresenterProtocol: class {
    var view: NewsListViewProtocol? { get set }
    var interactor: NewsListInteractorProtocol? { get set }
    var router: NewsListRouterProtocol? { get set }
    
    func viewIsReady()
}

protocol NewsListInteractorProtocol: class {
    var output: NewsListInteractorOutput? { get set }
}

protocol NewsListInteractorOutput: class {
    
}

protocol NewsListRouterProtocol: class {
	var navigationController: UINavigationController? { get set }
    static func pushNewsListScreen(navigationController: UINavigationController)
    static func showNewsListScreen(window: UIWindow)
}