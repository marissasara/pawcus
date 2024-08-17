//
//  JournalHistory.swift
//  PawCus
//
//  Created by STDC_27 on 08/08/2024.
//

import UIKit

struct JournalHistory {
    let photo: UIImage?
    let day: String
    let date: String
    let record: String
    let content: String
}

extension JournalHistory{
    static func sampleJournalHistory() -> [JournalHistory] {
        let history1 = UIImage(named: "history")
        let history2 = UIImage(named: "history 2")
        let history3 = UIImage(named: "history 3")
        let history4 = UIImage(named: "history 4")
        let history5 = UIImage(named: "history 5")
        
        let journalHistory1 = JournalHistory(photo: history1, day: "Thursday", date: "08 Aug 2024", record: "Focus Record: 4h", content: "Spent this session drafting a new blog post about the importance of time management. The ideas flowed easily, and I found myself in a creative zone where the words just kept coming. I didn’t overthink the structure too much and just let the content flow naturally. I know I’ll need to edit heavily tomorrow, but I’m happy with the raw material I produced today. The only downside was that I started to get a bit hungry towards the end, which slightly distracted me.")
        let journalHistory2 = JournalHistory(photo: history2, day: "Wednesday", date: "07 Aug 2024", record: "Focus Record: 2h", content: "Dedicated this session to a home workout, focusing on my arms and belly. I followed a HIIT routine, which included push-ups, planks, and dumbbell exercises. I felt energetic throughout the session, and I noticed I was able to do more reps than last week. My arms are definitely getting stronger, but I need to keep pushing myself if I want to see more definition in my belly. The session was intense, and by the end, I was sweating but felt great. I’ll aim for a similar workout tomorrow but might add some cardio to mix things up.")
        let journalHistory3 = JournalHistory(photo: history3, day: "Tuesday", date: "06 Aug 2024", record: "Focus Record: 1h", content: "Started the morning by diving into *Beware of Pity* by Stefan Zweig. The story is gripping, and I managed to read three chapters without losing focus. There were a couple of moments where I was tempted to check my phone, but I resisted and stayed in the flow. The themes of empathy and human connection are really resonating with me. Tomorrow, I plan to increase my focus session to 60 minutes and maybe take notes as I read to deepen my understanding.")
        let journalHistory4 = JournalHistory(photo: history4, day: "Tuesday", date: "06 Aug 2024", record: "Focus Record: 6h", content: "Reviewed my notes from the SwiftUI bootcamp, focusing specifically on animations and transitions. I practiced with a few small projects to solidify my understanding. The concepts are starting to click, but I realize I need more practice to become truly comfortable with them. During the session, I had a couple of moments where I got stuck, but I pushed through by referencing some of the bootcamp materials and Stack Overflow. I’ll need to revisit these topics again soon to ensure they stick.")
        let journalHistory5 = JournalHistory(photo: history5, day: "Monday", date: "05 Aug 2024", record: "Focus Record: 3h", content: "Continued working on my SwiftUI bootcamp project. I was trying to implement a custom animation for a button, but I encountered a tricky bug. It took me a while to figure out that the issue was with how I structured the state management. I almost got frustrated, but I took a deep breath and methodically worked through the problem. Eventually, I solved it, and the button now animates smoothly. It was a short session, but intense and productive. Next time, I’ll try to plan more breaks to avoid burnout.")
        
        return [journalHistory1, journalHistory2, journalHistory3, journalHistory4, journalHistory5]
    }
}
