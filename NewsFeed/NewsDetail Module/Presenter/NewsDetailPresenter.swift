//
//  NewsDetailPresenter.swift
//  
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.

class NewsDetailPresenter: NewsDetailPresenterProtocol, NewsDetailInteractorOutput {

    var view: NewsDetailViewProtocol?
    var interactor: NewsDetailInteractorProtocol?
    var router: NewsDetailRouterProtocol?

    func viewIsReady() {
        
    }
}
