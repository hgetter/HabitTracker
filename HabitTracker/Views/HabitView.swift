//
//  HabitView.swift
//  HabitTracker
//
//  Created by Harrison Getter on 11/29/23.
//

import SwiftUI

struct HabitView: View {
    @State var isCompleted: Bool
    var title: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
            }
            
            Spacer()
            
            Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(isCompleted ? .green : .gray)
                .onTapGesture {
                    isCompleted.toggle()
                }
        }
        .padding()
    }
}

struct HabitViewDate: View {
    @State var isCompleted: Bool
    var title: String
    var taskDate: Date

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                
                Text("\(formattedDate())")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(isCompleted ? .green : .gray)
                .onTapGesture {
                    isCompleted.toggle()
                }
        }
        .padding()
    }

    private func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: taskDate)
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            HabitViewDate(isCompleted: false, title: "Habit Title", taskDate: Date())
                .previewLayout(.sizeThatFits)
            HabitView(isCompleted: false, title: "Habit Title")
                .previewLayout(.sizeThatFits)
        }
    }
}
