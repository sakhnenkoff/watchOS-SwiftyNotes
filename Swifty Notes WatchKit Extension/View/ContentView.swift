//
//  ContentView.swift
//  Swifty Notes WatchKit Extension
//
//  Created by Matthew Sakhnenko on 03.01.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Property
    
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var notes: [Note] = [] {
        didSet {
            save()
        }
    }
    @State private var text: String = ""
    
    //MARK: - Body

    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add new note", text: $text)
                    Button {
                        guard !text.isEmpty else { return }
                        
                        let note = Note(id: UUID(), text: text)
                        notes.append(note)
                        text = ""
                        
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                    .font(.system(size: 42,weight: .semibold))
                }
                Spacer()
                
                if !notes.isEmpty {
                    List {
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    Text("\(notes[i].text)")
                                        .lineLimit(lineCount)
                                        .padding(.leading, 5)
                                }
                            }
                        }
                        .onDelete(perform: delete)
                    }
                    Text("\(notes.count)")
                    
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                }
            
            } // VSTACK
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                load()
            }
        } // Navigation view
    }
    
    //MARK: - Functions
    
    func getDocDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
        // dump(notes)
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocDirectory().appendingPathComponent("notes")
            try data.write(to: url)
            
        } catch {
            print("saving data has failed!")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do  {
                let url = getDocDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
        }
    }
    
    
}



//MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
