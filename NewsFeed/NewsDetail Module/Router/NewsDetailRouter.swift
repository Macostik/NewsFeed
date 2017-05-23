//
//  NewsDetailRouter.swift
//  
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.

import UIKit

class NewsDetailRouter: NewsDetailRouterProtocol {

    func showNewsListScreen() {

    	let topViewController = UIWindow.mainWindow.rootViewController
        topViewController?.dismiss(animated: true, completion: nil)
    }
}
    
