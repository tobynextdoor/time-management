//
//  Intent.swift
//  Time Management
//
//  Created by Tobias Wermuth on 19/06/16.
//  Copyright © 2016 Tobias Wermuth. All rights reserved.
//

import Foundation

struct Intent: Episodable, DynamicSchedulable, Equatable {
  var from: Date
  var to: Date
  
  var title: String
  var description: String?
  
  var length: TimeInterval
  var importance: Double
  
  init(from: Date, to: Date, title: String, length: TimeInterval, importance: Double) {
    self.from = from
    self.to = to
    self.title = title
    self.length = length
    self.importance = importance
  }
  
  func duration() -> TimeInterval {
    return length
  }
}

func ==(lhs: Intent, rhs: Intent) -> Bool {
  let areEqual = lhs.from == rhs.from &&
    lhs.to == rhs.to &&
    lhs.title == rhs.title &&
    lhs.description == rhs.description &&
    lhs.length == rhs.length &&
    lhs.importance == rhs.importance
  
  return areEqual
}
