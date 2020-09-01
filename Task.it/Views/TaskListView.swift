//
//  ContentView.swift
//  Task.it
//
//  Created by Christelle Nieves on 8/31/20.
//  Copyright © 2020 Christelle Nieves. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    let tasks = testDataTasks
    
    @State var presentAddNewItem = false
    @State var showSignInForm = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(taskListVM.taskCellViewModels) { taskCellVM in
                        TaskCell(taskCellVM: taskCellVM)
                    }
                    
                    if presentAddNewItem {
                        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "", completed: false))) { task in
                            self.taskListVM.addTask(task: task)
                            self.presentAddNewItem.toggle()
                        }
                    }
                }
                Button(action: {self.presentAddNewItem.toggle()}) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            
                        Text("Add New Task")
                    }
                }
                .padding(.leading)
                .foregroundColor(Color.blue)
            }
            .sheet(isPresented: $showSignInForm) {
                SignInView()
            }
        .navigationBarItems(trailing:
            Button(action: { self.showSignInForm.toggle() } ) {
                Image(systemName: "person.circle")
                .resizable()
                .frame(width: 35, height: 35)
        })
                .navigationBarTitle("My Tasks")
        }
        .colorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct TaskCell: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    
    var onCommit: (Task) -> (Void) = { _ in }
    
    var body: some View {
        HStack {
            Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    self.taskCellVM.task.completed.toggle()
            }
            TextField("Enter a new task", text: $taskCellVM.task.title, onCommit: {
                self.onCommit(self.taskCellVM.task)
            })
        }
    }
}
