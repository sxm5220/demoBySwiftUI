//
//  MainViewModel.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/18.
//

import Combine

class MainViewModel: ObservableObject {
    static var share: MainViewModel = MainViewModel()
    
    @Published var selectTab: Int = 0
    @Published var isShowMenu: Bool = false
}
