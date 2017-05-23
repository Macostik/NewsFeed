//
//  NewsListPresenter.swift
//  
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.

class NewsListPresenter: NewsListPresenterProtocol, NewsListInteractorOutput {
    
    var view: NewsListViewProtocol?
    var interactor: NewsListInteractorProtocol?
    var router: NewsListRouterProtocol?

    func viewIsReady() {
        view?.showLoading()
    }
    
    func showNewsDetailsScreen() {
        router?.showNewsDetailScreen()
    }
}
