//
//  Episodable.swift
//  Time Management
//
//  Created by Tobias Wermuth on 19/06/16.
//  Copyright © 2016 Tobias Wermuth. All rights reserved.
//

import Foundation

protocol TimeFramable {
  var from: Date { get set }
  var to: Date { get set }
  
  func frameDuration() -> TimeInterval
}

extension TimeFramable {
  func frameDuration() -> TimeInterval {
    return to.timeIntervalSince(from)
  }
}

protocol TimeDurationable {
  func duration() -> TimeInterval
}

protocol DynamicSchedulable {
  var length: TimeInterval { get set }
}

protocol Episodable: TimeFramable, TimeDurationable {
  var title: String { get set }
  var description: String? { get set }
}

extension Equatable where Self : Episodable {}

func ==(lhs: Episodable, rhs: Episodable) -> Bool {
  let areEqual = lhs.from == rhs.from &&
    lhs.to == rhs.to &&
    lhs.title == rhs.title &&
    lhs.description == rhs.description
  
  return areEqual
}
