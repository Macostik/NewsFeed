//
//  NewsListViewController.swift
//  
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.

import UIKit
import StreamView
import SnapKit

class NewsListViewController: UIViewController, NewsListViewProtocol {
    
    @IBOutlet var streamView: StreamView!
    var dataSource: StreamDataSource<[Feed]>?

    var presenter: NewsListPresenterProtocol?
    private let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewIsReady()
    }
    
    func setupUI() {
        spinner.hidesWhenStopped = true
        streamView.add(spinner) {
            $0.center.equalTo(streamView)
        }
        
        streamView.showsVerticalScrollIndicator = false
        streamView.layout = StreamLayout()
        dataSource = StreamDataSource(streamView: streamView)
        let metrics = StreamMetrics<FeedCell>(size: 70)
        
        metrics.selection = { view in
            
        }
        dataSource?.addMetrics(metrics: metrics)
    }
    
    func showLoading() {
        spinner.startAnimating()
    }
    
    func hideLoading() {
        spinner.stopAnimating()
    }
    
    func showNewsFeed(feedList: [Feed]) {
        dataSource?.items = feedList
    }


    // MARK: NewsListViewInput
    func setupInitialState() {
    }
}
