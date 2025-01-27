//
//  FacadeTests.swift
//  Login
//
//  Created by Tiago Linhares on 27/01/25.
//

@testable import Login
import Quick
import Nimble

final class FacadeTests: QuickSpec {
    override class func spec() {
        var navigationControllerMock: UINavigationController!
        var sut: LoginFacade!
        
        describe("facade") {
            beforeEach {
                navigationControllerMock = UINavigationController()
                sut = LoginFacade()
            }
            
            context("start") {
                beforeEach {
                    sut.start(
                        navigationController: navigationControllerMock,
                        at: .createAccount,
                        onFinish: {},
                        onAbort: {}
                    )
                }
                it("can push create account view") {
                    expect(navigationControllerMock.viewControllers).to(haveCount(1))
                }
                it("can exist singleton") {
                    expect(LoginSingleton.shared).toNot(beNil())
                }
                it("can exist main coordinator") {
                    expect(sut.coordinator).to(beAKindOf(LoginMainCoordinator.self))
                }
            }
            
            context("finish") {
                var onFinishCount = 0
                var onAbortCount = 0
                beforeEach {
                    sut.start(
                        navigationController: navigationControllerMock,
                        at: .createAccount,
                        onFinish: {
                            onFinishCount += 1
                        },
                        onAbort: {
                            onAbortCount += 1
                        }
                    )
                }
                it("can finish facade") {
                    LoginSingleton.shared?.finish()
                    expect(onFinishCount).to(equal(1))
                }
                it("can abort facade") {
                    LoginSingleton.shared?.abort()
                    expect(onAbortCount).to(equal(1))
                }
            }
        }
    }
}
