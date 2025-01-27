//
//  LoginMainCoordinatorTests.swift
//  Login
//
//  Created by Tiago Linhares on 27/01/25.
//

@testable import Login
import Quick
import Nimble

final class LoginMainCoordinatorTests: QuickSpec {
    override class func spec() {
        var mockNavigationController: UINavigationController!
        var sut: LoginMainCoordinator!
        
        describe("main coordinator") {
            beforeEach {
                mockNavigationController = UINavigationController()
            }
            
            context("start create account") {
                beforeEach {
                    sut = LoginMainCoordinator(
                        navigationController: mockNavigationController,
                        destination: .createAccount
                    )
                    sut.start()
                }
                it("can start create account") {
                    expect(sut.navigationController.viewControllers).to(haveCount(1))
                }
            }
            
            context("start login") {
                beforeEach {
                    sut = LoginMainCoordinator(
                        navigationController: mockNavigationController,
                        destination: .login
                    )
                    sut.start()
                }
                it("can start login") {
                    // TODO: Login
                    expect(sut.navigationController.viewControllers).to(haveCount(0))
                }
            }
        }
    }
}
