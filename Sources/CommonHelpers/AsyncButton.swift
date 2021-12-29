//
//  AsyncButton.swift
//  
//
//  Created by Florian Schweizer on 29.12.21.
//

import SwiftUI

struct AsyncButton<Label: View>: View {
    let action: (() async -> Void)
    @ViewBuilder let label: () -> Label
    
    var body: some View {
        Button {
            Task {
                await action()
            }
        } label: {
            label()
        }
    }
}
