//
//  NewsDetailProtocols.swift
//  
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.

import UIKit

protocol NewsDetailViewProtocol: class {
    var presenter: NewsDetailPresenterProtocol? { get set }
    
    func setupInitialState()
}

protocol NewsDetailPresenterProtocol: class {
    var view: NewsDetailViewProtocol? { get set }
    var interactor: NewsDetailInteractorProtocol? { get set }
    var router: NewsDetailRouterProtocol? { get set }
    
    func viewIsReady()
    func showNewsListScreen()
}

protocol NewsDetailInteractorProtocol: class {
    var output: NewsDetailInteractorOutput? { get set }
}

protocol NewsDetailInteractorOutput: class {
    
}

protocol NewsDetailRouterProtocol: class {
    func showNewsListScreen()
}
