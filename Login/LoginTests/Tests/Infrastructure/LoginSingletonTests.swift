//
//  LoginSingletonTests.swift
//  Login
//
//  Created by Tiago Linhares on 27/01/25.
//

@testable import Login
import Quick
import Nimble

final class LoginSingletonTests: QuickSpec {
    override class func spec() {
        describe("login singleton") {
            context("start") {
                beforeEach {
                    LoginSingleton.start(onFinish: {}, onAbort: {})
                }
                it("can initialize singleton") {
                    expect(LoginSingleton.shared).toNot(beNil())
                }
            }
            
            context("finish") {
                var onFinishCount = 0
                beforeEach {
                    LoginSingleton.start(onFinish: {
                        onFinishCount += 1
                    }, onAbort: {})
                    LoginSingleton.shared?.finish()
                }
                it("can finish") {
                    expect(onFinishCount).to(equal(1))
                }
            }
            
            context("abort") {
                var onAbortCount = 0
                beforeEach {
                    LoginSingleton.start(onFinish: {}, onAbort: {
                        onAbortCount += 1
                    })
                    LoginSingleton.shared?.abort()
                }
                it("can abort") {
                    expect(onAbortCount).to(equal(1))
                }
            }
        }
    }
}
