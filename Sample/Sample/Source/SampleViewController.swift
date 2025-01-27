//
//  SampleViewController.swift
//  Sample
//
//  Created by Tiago Linhares on 07/01/25.
//

import Router
import SharpnezDesignSystemUIKit
import SnapKit

final class SampleViewController: UIViewController {
    
    // MARK: Properties
    
    var sampleItem: [SampleItem]
    
    // MARK: UI elements
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    // MARK: Init
    
    init(sampleItem: [SampleItem]) {
        self.sampleItem = sampleItem
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sample"
        view.backgroundColor = .backgroundSH
        view.addSubview(stackView)
        stackView.snp.makeConstraints { $0.center.equalToSuperview() }
        
        sampleItem.forEach { item in
            let button = UISHButton(
                style: .primary(.primarySH, .onPrimarySH),
                title: item.title,
                font: .poppins,
                action: item.action
            )
            
            stackView.addArrangedSubview(button)
        }
    }
}
