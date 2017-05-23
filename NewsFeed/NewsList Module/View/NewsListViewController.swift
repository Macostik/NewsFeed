//
//  NewsListViewController.swift
//  
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.

import UIKit

class NewsListViewController: UIViewController, NewsListViewProtocol {

    var presenter: NewsListPresenterProtocol?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
    }


    // MARK: NewsListViewInput
    func setupInitialState() {
    }
}
