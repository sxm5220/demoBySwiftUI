//
//  +View.swift
//  demo05
//
//  Created by 宋晓明 on 2025/9/22.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing(_ aligment: Alignment) -> some View {
        self.frame(maxWidth: .infinity,alignment: aligment)
    }
    
    func vSpacing(_ aligment: Alignment) -> some View {
        self.frame(maxHeight: .infinity,alignment: aligment)
    }
    
    func isSameDate(_ date1: Date,_ date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
