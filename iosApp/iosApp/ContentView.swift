import SwiftUI
import shared
import KMPNativeCoroutinesAsync
import KMPNativeCoroutinesCore

struct ContentView: View {
	//let greet = Greeting().greet()
    @ObservedObject private(set) var viewModel: ViewModel
    var nombre: String
    
	var body: some View {
        Text(nombre).padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
        ListView(phares: viewModel.greetings)
            .onAppear{ self.viewModel.startObserving() }
	}
}

extension ContentView {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var greetings: Array<String> = []

        func startObserving() {
            Task {
                do {
                    let sequence = asyncSequence(for: Greeting().greet())
                    for try await phrase in sequence {
                        self.greetings.append(phrase)
                    }
                } catch {
                    print("Failed with error: \(error)")
                }
            }
        }
    }
}

struct ListView : View {
    let phares: Array<String>
    
    var body: some View {
        List(phares, id: \.self) {
            Text($0).padding(10)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//	static var previews: some View {
//		ContentView()
//	}
//}
