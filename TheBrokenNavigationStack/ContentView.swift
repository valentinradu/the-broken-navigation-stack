//
//  ContentView.swift
//  TheBrokenNavigationStack
//
//  Created by Valentin Radu on 20/03/2023.
//

import SwiftUI

enum Fragment {
    case childBlue
    case childGreen
}

struct ContentView: View {
    @State private var _path: [Fragment] = [.childBlue, .childGreen]

    var body: some View {
        NavigationStack(path: $_path) {
            Color.gray
                .onAppear {
                    print("Root appears")
                }
                .onDisappear {
                    print("Root disappears")
                }
                .navigationDestination(for: Fragment.self) {
                    switch $0 {
                    case .childBlue:
                        Color.blue
                            .onAppear {
                                print("Blue appears")
                            }
                            .onDisappear {
                                print("Blue disappears")
                            }
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                _path = [.childBlue, .childGreen]
                            }
                    case .childGreen:
                        Color.green
                            .onAppear {
                                print("Green appears")
                            }
                            .onDisappear {
                                print("Green disappears")
                            }
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                _path = []
                            }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    _path = [.childBlue]
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
