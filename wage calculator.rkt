;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |wage calculator|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct employee (name id hours salary))
(define-struct paycheck (name id amount))

;check expects

(check-expect (wage.v4 (cons (make-employee "Jenkins" 10223 40 10) (cons (make-employee "That Guy Everyone Hates Except the Boss" 30221 10 80) empty)))
(list (make-paycheck "Jenkins" 10223 400) (make-paycheck "That Guy Everyone Hates Except the Boss" 30221 800)))

(check-expect (wage.v4 (cons (make-employee "Broseph" 56542 400 1) (cons (make-employee "Peter Jackson" 3791 1 8000000000) empty)))
(list (make-paycheck "Broseph" 56542 400) (make-paycheck "Peter Jackson" 3791 8000000000)))

;Wage.v2
;takes a list of employees, computes pay by hours and salary, outputs paychecks in a list
;list->list
(define (wage.v4 l)
  (cond 
    [(empty? l) empty]
    [else (cons (make-paycheck (employee-name (first l)) (employee-id (first l)) (* (employee-hours (first l)) (employee-salary (first l)))) (wage.v4 (rest l)))]))

