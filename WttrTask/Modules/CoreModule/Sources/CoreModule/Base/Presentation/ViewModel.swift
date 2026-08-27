//
//  ViewModel.swift
//  CoreModule
//
//  Created by Baher Tamer on 27/08/2026.
//

import Observation

@MainActor
public protocol ViewModel: Observable, AnyObject {
    var state: ViewState { get set }

    func onInit()
    func onAppear()
    func onDisapper()
    func onRefresh()
    func onRetry()
}

public extension ViewModel {
    func onAppear() {}
    func onDisapper() {}
    func onRefresh() {}
    func onRetry() {}
}
