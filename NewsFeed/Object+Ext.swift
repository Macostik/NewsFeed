//
//  Object+Ext.swift
//  NewsFeed
//
//  Created by Yura Granchenko on 5/23/17.
//  Copyright © 2017 Yura Granchenko. All rights reserved.
//

import Foundation
import RealmSwift

typealias Block = (Void) -> Void
typealias ObjectBlock = (AnyObject?) -> Void
typealias FailureBlock = (NSError?) -> Void
typealias BooleanBlock = (Bool) -> Void

func getRealmEntry<T: RealmSwift.Object, U: Hashable>(_ type: T.Type, by id: U) -> T? {
    let realm = try! Realm()
    return realm.objects(type).filter("id = \(id)").first
}

extension Object {
    func entries<T: Object>() -> [T] {
        let realm = try! Realm()
        return realm.objects(T.self).array()
    }
}

extension Results {
    typealias T = Results.Generator.Element
    func array() -> [T] {
        return flatMap{ $0 }
    }
}

public extension Sequence {
    func find(predicate: (Iterator.Element) throws -> Bool) rethrows -> Iterator.Element? {
        for element in self {
            if try predicate(element) {
                return element
            }
        }
        return nil
    }
}

