;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |wage calculator|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct employee (name hours salary))
(define-struct paycheck (name amount))

;check expects

(check-expect (wage.v2 (cons (make-employee "Jenkins" 40 10) (cons (make-employee "That Guy Everyone Hates Except the Boss" 10 80) empty)))
(list (make-paycheck "Jenkins" 400) (make-paycheck "That Guy Everyone Hates Except the Boss" 800)))

(check-expect (wage.v2 (cons (make-employee "Broseph" 400 1) (cons (make-employee "Peter Jackson" 1 8000000000) empty)))
(list (make-paycheck "Broseph" 400) (make-paycheck "Peter Jackson" 8000000000)))

;Wage.v2
;takes a list of employees, computes pay by hours and salary, outputs paychecks in a list
;list->list
(define (wage.v2 l)
  (cond 
    [(empty? l) empty]
    [else (cons (make-paycheck (employee-name (first l)) (* (employee-hours (first l)) (employee-salary (first l)))) (wage.v2 (rest l)))]))

