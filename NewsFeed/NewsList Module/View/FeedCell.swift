//
//  FeedCell.swift
//  NewsFeed
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright © 2017 Yura Granchenko. All rights reserved.
//

import Foundation
import StreamView
import PINRemoteImage

class FeedCell: EntryStreamReusableView<Feed> {
    
    let titleLabel = specify(UILabel(), {
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 15)
    })
    let thumbImageView = UIImageView()
    
    override func setup(entry feed: Feed) {
        titleLabel.text = feed.title
        backgroundColor = UIColor.white
        
        thumbImageView.pin_updateWithProgress = true
        thumbImageView.pin_setImage(from: URL(string: feed.urlToImage)!)
    }
    
    override func layoutWithMetrics(metrics: StreamMetricsProtocol) {
        super.layoutWithMetrics(metrics: metrics)
        
        add(thumbImageView, {
            $0.leading.top.bottom.equalTo(self).inset(5)
            $0.width.equalTo(100)
        })
        add(titleLabel,  {
            $0.leading.equalTo(thumbImageView.snp.trailing).offset(12)
            $0.top.trailing.bottom.equalTo(self).inset(12)
        })
        add(specify(UIView(), {
            $0.backgroundColor = UIColor.lightGray
        }), {
            $0.leading.bottom.trailing.equalTo(self)
            $0.height.equalTo(1)
        })
    }
}
