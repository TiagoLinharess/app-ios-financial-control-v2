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
    
    var onStart: () -> Void
    var sampleTitle: String
    
    // MARK: Init
    
    init(
        onStart: @escaping () -> Void,
        sampleTitle: String
    ) {
        self.onStart = onStart
        self.sampleTitle = sampleTitle
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sample"
        view.backgroundColor = .backgroundSH
        
        let button = UISHButton(
            style: .primary(.primarySH, .onPrimarySH),
            title: sampleTitle,
            font: .poppins,
            action: onStart
        )
        
        view.addSubview(button)
        
        button.snp.makeConstraints { $0.center.equalToSuperview() }
    }
}

#Preview {
    SampleViewController(
        onStart: { },
        sampleTitle: "Sample"
    )
}
