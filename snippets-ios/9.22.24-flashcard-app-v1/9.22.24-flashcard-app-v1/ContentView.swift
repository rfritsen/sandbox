//
//  ContentView.swift
//  9.22.24-flashcard-app-v1
//
//  Created by Ryan on 9/22/24.
//

import SwiftUI

struct Flashcard: Identifiable {
    let id = UUID()
    let question: String
    let answer: String
}

class FlashcardViewModel: ObservableObject {
    @Published var flashcards: [Flashcard] = []
    @Published var currentIndex = 0
    @Published var showingAnswer = false
    
    func addFlashcard(question: String, answer: String) {
        flashcards.append(Flashcard(question: question, answer: answer))
    }
    
    func nextCard() {
        currentIndex = (currentIndex + 1) % flashcards.count
        showingAnswer = false
    }
    
    func previousCard() {
        currentIndex = (currentIndex - 1 + flashcards.count) % flashcards.count
        showingAnswer = false
    }
    
    func toggleAnswer() {
        showingAnswer.toggle()
    }
}

struct ContentView: View {
    @StateObject private var viewModel = FlashcardViewModel()
    @State private var newQuestion = ""
    @State private var newAnswer = ""
    
    var body: some View {
        VStack {
            if viewModel.flashcards.isEmpty {
                Text("No flashcards yet. Add some below!")
            } else {
                VStack {
                    Text(viewModel.showingAnswer ? "Answer" : "Question")
                        .font(.headline)
                    
                    Text(viewModel.showingAnswer ?
                         viewModel.flashcards[viewModel.currentIndex].answer :
                         viewModel.flashcards[viewModel.currentIndex].question)
                        .padding()
                        .frame(minHeight: 200)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                        .onTapGesture {
                            viewModel.toggleAnswer()
                        }
                    
                    HStack {
                        Button("Previous") { viewModel.previousCard() }
                        Spacer()
                        Button("Next") { viewModel.nextCard() }
                    }
                }
            }
            
            Divider()
            
            VStack {
                TextField("New Question", text: $newQuestion)
                TextField("New Answer", text: $newAnswer)
                Button("Add Flashcard") {
                    viewModel.addFlashcard(question: newQuestion, answer: newAnswer)
                    newQuestion = ""
                    newAnswer = ""
                }
                .disabled(newQuestion.isEmpty || newAnswer.isEmpty)
            }
            .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
