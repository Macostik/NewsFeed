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
        interactor?.recieveNewsFeed()
    }
    
    func showNewsDetailsScreen() {
        router?.showNewsDetailScreen()
    }
    
    func handleNewsFeed(feedsList feedList: [Feed]) {
        view?.showNewsFeed(feedList: feedList)
        view?.hideLoading()
    }
}
