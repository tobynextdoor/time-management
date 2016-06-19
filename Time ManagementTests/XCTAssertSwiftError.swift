//
//  XCTAssertSwiftError.swift
//
//  Created by LCS on 6/17/15.
//  Released into public domain; use at your own risk.
//

import XCTest


func XCTempAssertThrowsError(block: () throws -> ())
{
  do
  {
    try block()
    XCTFail("Tested block did not throw error as expected.")
  }
  catch {}
}


func XCTempAssertThrowsSpecificError(kind: ErrorProtocol, block: () throws -> ())
{
  do
  {
    try block()
    XCTFail("Tested block did not throw expected \(kind) error.")
  }
  catch let error as NSError
  {
    let expected = kind as NSError
    if ((error.domain != expected.domain) || (error.code != expected.code))
    {
      XCTFail("Tested block threw \(error), not expected \(kind) error.")
    }
  }
}
