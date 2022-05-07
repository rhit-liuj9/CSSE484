//
//  Constants.swift
//  Rose Grade Tracker
//
//  Created by Jingkun Liu on 4/30/22.
//

import Foundation

class Constants {
    // courses
    static let FIRESTORE_COURSE_COLLETION_PATH = "courses"
    static let FIRESTORE_COURSE_NUMBER_KEY = "courseNumber"
    static let FIRESTORE_COURSE_NAME_KEY = "courseName"
    static let FIRESTORE_COURSE_SECTION_KEY = "section"
    static let FIRESTORE_COURSE_QUARTER_KEY = "quarter"
    static let FIRESTORE_COURSE_YEAR_KEY = "year"
    static let FIRESTORE_COURSE_TAKEN_BY_KEY = "takenBy"
    
    // Participation Grade
    static let FIRESTORE_COURSE_PARTICIPATION_GRADE_KEY = "participationGrade"
    static let FIRESTORE_COURSE_PARTICIPATION_WEIGHT_KEY = "participationWeight"
    
    // Assignments Grades
    static let FIRESTORE_COURSE_ASSIGNMENTS_GRADE_KEY = "assignmentsGrades"
    static let FIRESTORE_COURSE_ASSIGNMENTS_WEIGHT_KEY = "assignmentsWeight"
    
    // Exam Grades
    static let FIRESTORE_COURSE_EXAMS_GRADE_KEY = "examsGrades"
    static let FIRESTORE_COURSE_EXAMS_WEIGHT_KEY = "examsWeight"
    
    // Labs Grades
    static let FIRESTORE_COURSE_LABS_GRADE_KEY = "labsGrades"
    static let FIRESTORE_COURSE_LABS_WEIGHT_KEY = "labsWeight"
    
    // Quizzes Grades
    static let FIRESTORE_COURSE_QUIZZES_GRADE_KEY = "quizzesGrades"
    static let FIRESTORE_COURSE_QUIZZES_WEIGHT_KEY = "quizzesWeight"
    
    // Grade Keys
    static let FIRESTORE_WEIGHT_KEY = "weight"
    static let FIRESTORE_GRADE_KEY = "grade"
    static let FIRESTORE_NAME_KEY = "name"
    
    // users
    static let FIRESTORE_USER_COLLECTION_PATH = "users"
    static let FIRESTORE_USER_NAME = "name"
    static let FIRESTORE_USER_PHOTO_URL = "photoUrl"
    
    // Course Templates
    static let FIRESTORE_COURSE_TEMPLATES_COLLECTION_PATH = "templates"
    static let FIRESTORE_COURSE_TEMPLATES_NAME_KEY = "name"
    static let FIRESTORE_COURSE_TEMPLATES_NUMBER_KEY = "number"
    static let FIRESTORE_COURSE_TEMPLATES_PARTICIPATION_WEIGHT_KEY = "pWeight"
    static let FIRESTORE_COURSE_TEMPLATES_ASSIGNMENTS_WEIHGT_KEY = "aWeight"
    static let FIRESTORE_COURSE_TEMPLATES_EXAMS_WEIGHT_KEY = "eWeight"
    static let FIRESTORE_COURSE_TEMPLATES_LABS_WEIGHT_KEY = "lWeight"
    static let FIRESTORE_COURSE_TEMPLATES_QUIZZES_WEIGHT_KEY = "qWeight"
    
    // Cloud Functions
    static let CLOUD_FUNCTIONS_URL = "https://us-central-rose-gradebook-ios.cloudfunctions.net"
    
    // Rosefire
    static let ROSEFIRE_REGISTRY_TOKEN = "33d13b03-2362-42cf-9786-f552b4e96d6e"
    
    // Segue Identifier
    static let SHOW_COURSE_LIST_SEQUE = "showCourseListSegue"
}