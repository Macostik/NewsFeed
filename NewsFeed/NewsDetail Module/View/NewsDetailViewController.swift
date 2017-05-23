//
//  NewsDetailViewController.swift
//  
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.

import UIKit

class NewsDetailViewController: UIViewController, NewsDetailViewProtocol {

    var presenter: NewsDetailPresenterProtocol?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
    }


    // MARK: NewsDetailViewInput
    func setupInitialState() {
    }
}
