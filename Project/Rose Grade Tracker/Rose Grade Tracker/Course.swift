//
//  Course.swift
//  Rose Grade Tracker
//
//  Created by Jingkun Liu on 4/30/22.
//

import Foundation
import Firebase

class Course {
    var name: String
    var number: String
    var section: Int
    var quarter: Int
    var year: Int
    var credit: Int
    var documentId: String?
    
    // weights
    var assignmentsWeight: Int?
    var examsWeight: Int?
    var labsWeight: Int?
    var quizzesWeight: Int?
    var partWeight: Int?
    
    // grades
    var partGrade: Double?
    var assignmentsGrade = [(weight: Int, grade: Double, displayName: String)]()
    var examsGrade = [(weight: Int, grade: Double, displayName: String)]()
    var labsGrade = [(weight: Int, grade: Double, displayName: String)]()
    var quizzesGrade = [(weight: Int, grade: Double, displayName: String)]()
    
    init(
        name: String,
        number: String,
        section: Int,
        quarter: Int,
        year: Int,
        credits: Int
    ) {
        self.name = name
        self.number = number
        self.section = section
        self.quarter = quarter
        self.year = year
        self.credit = credits
    }
    
    init(snapshot: DocumentSnapshot) {
        self.documentId = snapshot.documentID
        self.name = snapshot.get(Constants.FIRESTORE_COURSE_NAME_KEY) as? String ?? ""
        self.number = snapshot.get(Constants.FIRESTORE_COURSE_NUMBER_KEY) as? String ?? ""
        
        print("Language \(Locale.autoupdatingCurrent.languageCode ?? "")")
        if let localcode = Locale.autoupdatingCurrent.languageCode {
            if let namesTranslated = snapshot.get(Constants.FIRESTORE_COURSE_NAME_TRANSLATED_KEY) as? [String: String] {
                if let translated = namesTranslated[localcode] {
                    self.name = translated
                }
            }
        }
//        self.name = "\(snapshot.get(Constants.FIRESTORE_COURSE_NUMBER_KEY) ?? "") \(snapshot.get(Constants.FIRESTORE_COURSE_NAME_KEY) ?? "")"
//        self.section = String(format: "%02d", snapshot.get(Constants.FIRESTORE_COURSE_SECTION_KEY) as? Int ?? 0)
//        self.quarter = Utils.parseQuarter(quarter: snapshot.get(Constants.FIRESTORE_COURSE_QUARTER_KEY) as? Int ?? 0)
        self.section = snapshot.get(Constants.FIRESTORE_COURSE_SECTION_KEY) as? Int ?? 0
        self.quarter = snapshot.get(Constants.FIRESTORE_COURSE_QUARTER_KEY) as? Int ?? 0
        self.year = snapshot.get(Constants.FIRESTORE_COURSE_YEAR_KEY) as? Int ?? 0
        self.credit = snapshot.get(Constants.FIREBASE_COURSE_CREDIT_KEY) as? Int ?? 0
        
        self.partWeight = snapshot.get(Constants.FIRESTORE_COURSE_PARTICIPATION_WEIGHT_KEY) as? Int
        self.partGrade = snapshot.get(Constants.FIRESTORE_COURSE_PARTICIPATION_GRADE_KEY) as? Double
        
        // assignments
        self.assignmentsWeight = snapshot.get(Constants.FIRESTORE_COURSE_ASSIGNMENTS_WEIGHT_KEY) as? Int
        if let assignmentGrades = snapshot.get(Constants.FIRESTORE_COURSE_ASSIGNMENTS_GRADE_KEY)
            as? [[String: Any]] {
            
            for gradeDict in assignmentGrades {
                let weight = gradeDict[Constants.FIRESTORE_WEIGHT_KEY] as? Int ?? 0
                let grade = gradeDict[Constants.FIRESTORE_GRADE_KEY] as? Double ?? 0.0
                let displayName = gradeDict[Constants.FIRESTORE_NAME_KEY] as? String ?? ""
                
                self.assignmentsGrade.append((weight, grade, displayName))
            }
        }
        
        // exams
        self.examsWeight = snapshot.get(Constants.FIRESTORE_COURSE_EXAMS_WEIGHT_KEY) as? Int
        if let examGrades = snapshot.get(Constants.FIRESTORE_COURSE_EXAMS_GRADE_KEY)
            as? [[String: Any]] {

            for gradeDict in examGrades {
                let weight = gradeDict[Constants.FIRESTORE_WEIGHT_KEY] as? Int ?? 0
                let grade = gradeDict[Constants.FIRESTORE_GRADE_KEY] as? Double ?? 0.0
                let displayName = gradeDict[Constants.FIRESTORE_NAME_KEY] as? String ?? ""
                
                self.examsGrade.append((weight, grade, displayName))
            }
        }
        print(self.examsGrade)
        
        // labs
        self.labsWeight = snapshot.get(Constants.FIRESTORE_COURSE_LABS_WEIGHT_KEY) as? Int
        if let labGrades = snapshot.get(Constants.FIRESTORE_COURSE_LABS_GRADE_KEY)
            as? [[String: Any]] {
            
            for gradeDict in labGrades {
                let weight = gradeDict[Constants.FIRESTORE_WEIGHT_KEY] as? Int ?? 0
                let grade = gradeDict[Constants.FIRESTORE_GRADE_KEY] as? Double ?? 0.0
                let displayName = gradeDict[Constants.FIRESTORE_NAME_KEY] as? String ?? ""
                
                self.labsGrade.append((weight, grade, displayName))
            }
        }
        
        // quizzes
        self.quizzesWeight = snapshot.get(Constants.FIRESTORE_COURSE_QUIZZES_WEIGHT_KEY) as? Int
        if let quizGrades = snapshot.get(Constants.FIRESTORE_COURSE_QUIZZES_GRADE_KEY)
            as? [[String: Any]] {
            
            for gradeDict in quizGrades {
                let weight = gradeDict[Constants.FIRESTORE_WEIGHT_KEY] as? Int ?? 0
                let grade = gradeDict[Constants.FIRESTORE_GRADE_KEY] as? Double ?? 0.0
                let displayName = gradeDict[Constants.FIRESTORE_NAME_KEY] as? String ?? ""
                
                self.quizzesGrade.append((weight, grade, displayName))
            }
        }
    }
}
