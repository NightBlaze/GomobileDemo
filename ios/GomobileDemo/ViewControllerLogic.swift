//
//  ViewControllerLogic.swift
//  GomobileDemo
//
//  Created by Alexander Timonenkov on 09.04.2023.
//

import Engine
import UIKit

class ViewControllerLogic_Logic: NSObject, EngineDelegateProtocol {
    private static var jobsDone = 0
    private lazy var engineLogic = EngineNewLogic(self)

    override init() {
        super.init()
        print("\(Date()) Init logic \(Unmanaged.passUnretained(self).toOpaque())")
    }

    deinit {
        print("\(Date()) Deinit logic \(Unmanaged.passUnretained(self).toOpaque())")
    }

    func free() {
        engineLogic?.free()
        engineLogic = nil
    }

    func executeJob() {
        engineLogic?.executeJob(Self.jobsDone)
    }

    // MARK: - EngineDelegateProtocol
    func done(_ p0: Int) {
        Self.jobsDone = p0
        print("Done \(Self.jobsDone)")
    }
}

class ViewControllerLogic: UIViewController {
    private var logic: ViewControllerLogic_Logic?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("\n\(Date()) Init view controller \(Unmanaged.passUnretained(self).toOpaque())")
        logic = ViewControllerLogic_Logic()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        logic?.executeJob()
    }

    deinit {
        print("\(Date()) Deinit view controller \(Unmanaged.passUnretained(self).toOpaque())")
        logic?.free()
        logic = nil
    }
}
